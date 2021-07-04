Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E041C3BAF0E
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jul 2021 22:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhGDUpv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Jul 2021 16:45:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:39440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhGDUpv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 4 Jul 2021 16:45:51 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A4416135A;
        Sun,  4 Jul 2021 20:43:10 +0000 (UTC)
Date:   Sun, 4 Jul 2021 21:45:35 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [RFC 02/11] drivers: Add HTE subsystem
Message-ID: <20210704214535.3e8f682a@jic23-huawei>
In-Reply-To: <20210704211525.4efb6ba0@jic23-huawei>
References: <20210625235532.19575-1-dipenp@nvidia.com>
        <20210625235532.19575-3-dipenp@nvidia.com>
        <20210704211525.4efb6ba0@jic23-huawei>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 4 Jul 2021 21:15:25 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 25 Jun 2021 16:55:23 -0700
> Dipen Patel <dipenp@nvidia.com> wrote:
> 
> > Some devices can timestamp system lines/signals/Buses in real-time
> > using the hardware counter or other hardware means which can give
> > finer granularity and help avoid jitter introduced by software means
> > of timestamping. To utilize such functionality there has to be
> > framework where such devices can register themselves as producers or
> > providers so that the consumers or clients devices can request specific
> > line from the providers. This patch introduces such subsystem as
> > hardware timestamping engine (HTE).
> > 
> > It provides below APIs for the provider:
> > - hte_register_chip() -- To register the HTE chip.
> > - hte_unregister_chip() -- To unregister the HTE chip.
> > - hte_push_ts_ns_atomic() -- To push timestamp data into HTE subsystem.
> > 
> > It provides below APIs for the consumer:
> > - of_hte_request_ts() -- To request timestamp functionality.
> > - devm_of_hte_request_ts() -- Managed version of the above.
> > - hte_req_ts_by_dt_node() -- To request timestamp functionality by
> > using HTE provider dt node.
> > - devm_hte_release_ts() -- The managed version to release timestamp
> > functionality and associated resources.
> > - hte_retrieve_ts_ns() -- To retrieve timestamps.
> > - hte_retrieve_ts_ns_wait() -- Same as above but blocking version.
> > - hte_enable_ts() -- To disable timestamp functionality.
> > - hte_disable_ts() -- To enable timestamp functionality.
> > - hte_available_ts() -- To query available timestamp data.
> > - hte_release_ts() -- To release timestamp functionality and its
> > associated resources.
> > - hte_get_clk_src_info() -- To query clock source information from
> > the provider
> > 
> > It provides centralized software buffer management per requested id to
> > store the timestamp data for the consumers as below:
> > - hte_set_buf_len() -- To set the buffer length.
> > - hte_get_buf_len() -- To get the buffer length.
> > - hte_set_buf_watermark() -- To set the software threshold/watermark.
> > - hte_get_buf_watermark() -- To get the software threshold/watermark.
> > 
> > The detail about parameters and API usage are described in each
> > functions definitions in drivers/hte/hte.c file.
> > 
> > The patch adds compilation support in Makefile and menu options in
> > Kconfig.
> > 
> > Signed-off-by: Dipen Patel <dipenp@nvidia.com>  
> 
> Hi Dipen, this isn't a particularly thorough review as I'm still getting my head
> around what this is doing + it is an RFC :)

Having read on through the rest of the series, one of the biggest things that became
clear is you have more layers of abstraction in here than make sense.  Squash things
together so you have fewer allocations (and hence fewer error paths etc).
Don't introduce ops functions unless you have more than one answer to what they
are (and a clear justification for those).   It's easy to add layers of indirection
later, but for now they just make your code harder to read.  Reality is that the buffer
is a kfifo, make it so everywhere, rather than pretending otherwise.

I thought for a while that you were allowing a different buffer implementation for
each of the your hte chips and was very confused as to why that would make sense.

Anyhow, it's interesting.  I'm not sure yet if the way it all fits together makes
sense and you will almost certainly want to support hardware FIFOs and those tend
to want to be partly exposed through to the consumer.

As to similar devices.  Lots of sensorhubs have timestamping facilities but it is
tightly coupled to the data streams, so probably doesn't make sense to map to a
generic subsystem like this.  You'll hit some of the same issues as those though
when you try to align these timestamps with system ones etc.

otherwise, some of the counter devices are closer to this.  Perhaps the ti ecap?
https://www.ti.com/lit/ug/spru807b/spru807b.pdf?ts=1625431159791&ref_url=https%253A%252F%252Fwww.google.com%252F

That has a short hardware buffer and can be used for absolute timestamp grabbing
on rising triggers etc.

Jonathan


> 
> > ---
> >  drivers/Kconfig      |    2 +
> >  drivers/Makefile     |    1 +
> >  drivers/hte/Kconfig  |   22 +
> >  drivers/hte/Makefile |    1 +
> >  drivers/hte/hte.c    | 1368 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/hte.h  |  278 +++++++++
> >  6 files changed, 1672 insertions(+)
> >  create mode 100644 drivers/hte/Kconfig
> >  create mode 100644 drivers/hte/Makefile
> >  create mode 100644 drivers/hte/hte.c
> >  create mode 100644 include/linux/hte.h
> > 
> > diff --git a/drivers/Kconfig b/drivers/Kconfig
> > index 47980c6b1945..9b078964974b 100644
> > --- a/drivers/Kconfig
> > +++ b/drivers/Kconfig
> > @@ -238,4 +238,6 @@ source "drivers/interconnect/Kconfig"
> >  source "drivers/counter/Kconfig"
> >  
> >  source "drivers/most/Kconfig"
> > +
> > +source "drivers/hte/Kconfig"
> >  endmenu
> > diff --git a/drivers/Makefile b/drivers/Makefile
> > index 5a6d613e868d..0a996a698e4c 100644
> > --- a/drivers/Makefile
> > +++ b/drivers/Makefile
> > @@ -190,3 +190,4 @@ obj-$(CONFIG_GNSS)		+= gnss/
> >  obj-$(CONFIG_INTERCONNECT)	+= interconnect/
> >  obj-$(CONFIG_COUNTER)		+= counter/
> >  obj-$(CONFIG_MOST)		+= most/
> > +obj-$(CONFIG_HTE)		+= hte/
> > diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
> > new file mode 100644
> > index 000000000000..394e112f7dfb
> > --- /dev/null
> > +++ b/drivers/hte/Kconfig
> > @@ -0,0 +1,22 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +menuconfig HTE
> > +        bool "Hardware Timestamping Engine (HTE) Support"
> > +        help
> > +          Hardware Timestamping Engine (HTE) Support.  
> 
> Tidy this up, but think that's already been commented on.
> 
> > +
> > +          Some devices provide hardware timestamping engine which can timestamp
> > +	  certain device lines/signals in realtime. This way to provide
> > +	  hardware assisted timestamp to generic signals like GPIOs, IRQs lines
> > +	  comes with benefit for the applications like autonomous machines
> > +	  needing accurate timestamping event with less jitter.
> > +
> > +	  This framework provides a generic interface to such HTE devices
> > +          within the Linux kernel. It provides an API to register and
> > +	  unregister a HTE provider chip, configurable sw buffer to
> > +	  store the timestamps, push the timestamp from the HTE providers and
> > +	  retrieve timestamps for the consumers. It also provides means for the
> > +	  consumers to request signals it wishes to hardware timestamp and
> > +	  release them if not required.
> > +
> > +          If unsure, say no.
> > +
> > diff --git a/drivers/hte/Makefile b/drivers/hte/Makefile
> > new file mode 100644
> > index 000000000000..9899dbe516f7
> > --- /dev/null
> > +++ b/drivers/hte/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_HTE)		+= hte.o
> > diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
> > new file mode 100644
> > index 000000000000..c53260d1e250
> > --- /dev/null
> > +++ b/drivers/hte/hte.c
> > @@ -0,0 +1,1368 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 NVIDIA Corporation
> > + *
> > + * Author: Dipen Patel <dipenp@nvidia.com>
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/err.h>
> > +#include <linux/slab.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/kfifo.h>
> > +#include <linux/mutex.h>
> > +#include <linux/sched.h>
> > +#include <linux/uaccess.h>
> > +#include <linux/hte.h>
> > +#include <linux/delay.h>
> > +#include <linux/debugfs.h>
> > +
> > +/* Global list of the HTE devices */
> > +static DEFINE_SPINLOCK(hte_lock);
> > +static LIST_HEAD(hte_devices);
> > +
> > +enum {
> > +	HTE_TS_REGISTERED,
> > +	HTE_TS_DISABLE,
> > +};
> > +
> > +/* Default FIFO depth */
> > +#define HTE_EV_FIFO_EL		32
> > +
> > +#define HTE_TS_NAME_LEN		10
> > +
> > +struct hte_ts_buf;
> > +
> > +/**
> > + * struct hte_ts_buf_acc_func - Software buffer management functions.
> > + * @store: Store timestamp from atomic context as providers most likely
> > + * be pushing timestamps from their interrupt handlers.
> > + * @read: Read timestamps from the buffer.
> > + * @el_available: Available timestamps to retrieve. The client can use this to
> > + * query available elements so that it can pre-allocate internal buffer to send
> > + * to during hte_retrieve_ts_ns API.
> > + * @set_length: Set length/depth of the buffer.
> > + * @get_length: Get length/depth of the buffer.
> > + * @set_watermark: Set software threshold of the buffer.
> > + * @get_watermark: Get software threshold of the buffer.
> > + * @release: Release/free buffer.
> > + * @reset: Reset the buffer.
> > + */
> > +struct hte_ts_buf_acc_func {
> > +	unsigned int (*store)(struct hte_ts_buf *buf, void *data, size_t n);
> > +	int (*read)(struct hte_ts_buf *buf, unsigned char *data, size_t n,
> > +		    size_t *copied);
> > +	size_t (*el_available)(struct hte_ts_buf *buf);
> > +	int (*set_length)(struct hte_ts_buf *buf,
> > +			  size_t length, size_t bpd);
> > +	size_t (*get_length)(struct hte_ts_buf *buf);
> > +	int (*set_watermark)(struct hte_ts_buf *buf,
> > +			     size_t val);
> > +	size_t (*get_watermark)(struct hte_ts_buf *buf);
> > +	void (*release)(struct hte_ts_buf *buf);
> > +	void (*reset)(struct hte_ts_buf *buf);
> > +};
> > +
> > +/**
> > + * struct hte_ts_buf - Software buffer per requested id or entity to store
> > + * timestamps.
> > + *
> > + * @datum_len: Buffer depth or number of elements.
> > + * @bytes_per_datum: Element size in bytes.
> > + * @watermark: Software threshold at which client will be notified.
> > + * @valid: Validity of the buffer.
> > + * @pollq: Waitqueue for the blocking clients.
> > + * @access: Various buffer management functions.
> > + */
> > +struct hte_ts_buf {
> > +	size_t datum_len;
> > +	size_t bytes_per_datum;
> > +	size_t watermark;
> > +	bool valid;
> > +	wait_queue_head_t pollq;
> > +	const struct hte_ts_buf_acc_func *access;
> > +};
> > +
> > +/**
> > + * struct hte_ts_info - Information related to requested timestamp.
> > + *
> > + * @xlated_id: Timestamp ID as understood between HTE subsys and HTE provider,
> > + * See xlate callback API.
> > + * @flags: Flags holding state informations.
> > + * @seq: Timestamp sequence counter.
> > + * @dropped_ts: Dropped timestamps.
> > + * @cb: Callback to notify clients.
> > + * @mlock: Lock during timestamp request/release APIs.
> > + * @ts_dbg_root: Root for the debug fs.
> > + * @gdev: HTE abstract device that this timestamp belongs to.
> > + * @buf: Per requested timestamp software buffer.
> > + * @desc: Timestamp descriptor understood between clients and HTE subsystem.
> > + */
> > +struct hte_ts_info {
> > +	u32 xlated_id;
> > +	unsigned long flags;
> > +	u64 seq;
> > +	atomic_t dropped_ts;
> > +	void (*cb)(enum hte_notify n);
> > +	struct mutex mlock;
> > +	struct dentry *ts_dbg_root;
> > +	struct hte_device *gdev;
> > +	struct hte_ts_buf *buf;

Where there is one instance, just embed it.  Lots of small allocations just make
for less readable code.

> > +	struct hte_ts_desc *desc;
> > +};
> > +
> > +/**
> > + * struct hte_device - HTE abstract device
> > + * @nlines: Number of entities this device supports.
> > + * @ts_req: Total number of entities requested.
> > + * @ei: Timestamp information.
> > + * @sdev: Device used at various debug prints.
> > + * @dbg_root: Root directory for debug fs.
> > + * @list: List node for internal use.  
> 
> Be more specific of what sort of internal use.
> 
> > + * @chip: HTE chip providing this HTE device.
> > + * @owner: helps prevent removal of modules when in use.
> > + */
> > +struct hte_device {
> > +	u32 nlines;
> > +	atomic_t ts_req;
> > +	struct hte_ts_info *ei;
> > +	struct device *sdev;
> > +	struct dentry *dbg_root;
> > +	struct list_head list;
> > +	struct hte_chip *chip;
> > +	struct module *owner;
> > +};
> > +
> > +/* Buffer management functions */
> > +
> > +/**
> > + * struct hte_kfifo - Software buffer wrapper.
> > + * @buffer: Abstract buffer device.
> > + * @gkf: Actual software buffer type, this case its FIFO.
> > + */
> > +struct hte_kfifo {
> > +	struct hte_ts_buf buffer;
> > +	struct kfifo gkf;
> > +};
> > +
> > +#define buf_to_kfifo(r) container_of(r, struct hte_kfifo, buffer)
> > +
> > +static unsigned int hte_ts_store_to_buf(struct hte_ts_buf *r, void *data,
> > +					size_t n)
> > +{
> > +	struct hte_kfifo *kf = buf_to_kfifo(r);
> > +
> > +	if (unlikely(!r->valid))
> > +		return 0;
> > +
> > +	return kfifo_in(&kf->gkf, (unsigned char *)data, n);
> > +}
> > +
> > +static inline int hte_ts_buf_read(struct hte_ts_buf *r,
> > +				  unsigned char *buf, size_t n,
> > +				  size_t *copied)
> > +{
> > +	struct hte_kfifo *kf = buf_to_kfifo(r);
> > +
> > +	if ((!r->valid) || (n < kfifo_esize(&kf->gkf)))
> > +		return -EINVAL;
> > +
> > +	*copied = kfifo_out(&kf->gkf, buf, n);
> > +
> > +	return 0;
> > +}
> > +
> > +static size_t hte_ts_buf_el_available(struct hte_ts_buf *r)
> > +{
> > +	struct hte_kfifo *kf = buf_to_kfifo(r);
> > +
> > +	if (!r->valid)
> > +		return 0;
> > +
> > +	return (kfifo_len(&kf->gkf) / r->bytes_per_datum);
> > +}
> > +
> > +static int hte_ts_buf_set_length(struct hte_ts_buf *r,
> > +				 size_t length, size_t bpd)
> > +{
> > +	int ret = 0;
> > +	struct hte_kfifo *buf;
> > +
> > +	if ((length == 0) || (bpd == 0) || !r)
> > +		return -EINVAL;
> > +
> > +	buf = buf_to_kfifo(r);
> > +
> > +	if (r->datum_len != length) {
> > +		if (r->valid)
> > +			kfifo_free(&buf->gkf);
> > +		r->valid = false;
> > +		r->datum_len = length;
> > +		r->bytes_per_datum = bpd;
> > +		ret = kfifo_alloc(&buf->gkf, length * bpd, GFP_KERNEL);
> > +		if (!ret)
> > +			r->valid = true;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static inline size_t hte_ts_buf_get_length(struct hte_ts_buf *r)
> > +{
> > +	if ((!r->valid) || !r->datum_len)
> > +		return 0;
> > +
> > +	return r->datum_len;
> > +}
> > +
> > +static inline int hte_ts_buf_set_watermark(struct hte_ts_buf *r, size_t val)
> > +{
> > +	if ((!r->valid) || (val > r->datum_len))
> > +		return -EINVAL;
> > +
> > +	r->watermark = val;
> > +
> > +	return 0;
> > +}
> > +
> > +static inline size_t hte_ts_buf_get_watermark(struct hte_ts_buf *r)
> > +{
> > +	if (!r->valid)
> > +		return 0;
> > +
> > +	return r->watermark;
> > +}
> > +
> > +static inline void hte_ts_buf_release(struct hte_ts_buf *r)
> > +{
> > +	struct hte_kfifo *kf = buf_to_kfifo(r);
> > +
> > +	r->valid = false;
> > +	kfifo_free(&kf->gkf);
> > +	kfree(kf);
> > +}
> > +
> > +static inline void hte_ts_buf_reset(struct hte_ts_buf *r)
> > +{
> > +	struct hte_kfifo *kf = buf_to_kfifo(r);
> > +
> > +	if (!r->valid)
> > +		return;
> > +
> > +	kfifo_reset(&kf->gkf);
> > +}
> > +
> > +static const struct hte_ts_buf_acc_func kfifo_access_funcs = {
> > +	.store = &hte_ts_store_to_buf,
> > +	.read = &hte_ts_buf_read,
> > +	.el_available = &hte_ts_buf_el_available,
> > +	.set_length = &hte_ts_buf_set_length,
> > +	.get_length = &hte_ts_buf_get_length,
> > +	.set_watermark = &hte_ts_buf_set_watermark,
> > +	.get_watermark = &hte_ts_buf_get_watermark,
> > +	.release = &hte_ts_buf_release,
> > +	.reset = &hte_ts_buf_reset,
> > +};
> > +
> > +static struct hte_ts_buf *hte_ts_buf_allocate(void)
> > +{
> > +	struct hte_kfifo *kf;
> > +
> > +	kf = kzalloc(sizeof(*kf), GFP_KERNEL);
> > +	if (!kf)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	init_waitqueue_head(&kf->buffer.pollq);
> > +	kf->buffer.watermark = 1;
> > +	kf->buffer.datum_len = 0;
> > +	kf->buffer.valid = false;
> > +	kf->buffer.access = &kfifo_access_funcs;

Why do you have this level abstraction?  I would suggest you flatten all this
into direct calls until you have some clear need for multiple buffer types.

A long long time ago (10 years or more) we had similar abstractions in IIO because
we though it would be helpful to support ring buffers and kfifos.  It wasn't, we ended
up ripping them all out because all they resulted in was a more complex code base
when in reality everyone was happy with a kfifo.

Jonathan


> > +
> > +	return &kf->buffer;
> > +}
> > +/* End of buffer management */
> > +
> > +/* Debugfs management */
> > +
> > +#ifdef CONFIG_DEBUG_FS
> > +
> > +static struct dentry *hte_root;
> > +
> > +static void __init hte_subsys_dbgfs_init(void)
> > +{
> > +	/* creates /sys/kernel/debug/hte/ */
> > +	hte_root = debugfs_create_dir("hte", NULL);
> > +}
> > +subsys_initcall(hte_subsys_dbgfs_init);
> > +
> > +static void hte_chip_dbgfs_init(struct hte_device *gdev)
> > +{
> > +	const struct hte_chip *chip = gdev->chip;
> > +	const char *name = chip->name ? chip->name : dev_name(chip->dev);
> > +
> > +	gdev->dbg_root = debugfs_create_dir(name, hte_root);
> > +	if (!gdev->dbg_root)
> > +		return;
> > +
> > +	debugfs_create_atomic_t("ts_requested", 0444, gdev->dbg_root,
> > +				&gdev->ts_req);
> > +	debugfs_create_u32("total_ts", 0444, gdev->dbg_root,
> > +			   &gdev->nlines);
> > +}
> > +
> > +static void hte_ts_dbgfs_init(const char *name, struct hte_ts_info *ei)
> > +{
> > +	if (!ei->gdev->dbg_root || !name)
> > +		return;
> > +
> > +	ei->ts_dbg_root = debugfs_create_dir(name, ei->gdev->dbg_root);
> > +	if (!ei->ts_dbg_root)
> > +		return;
> > +
> > +	debugfs_create_size_t("ts_buffer_depth", 0444, ei->ts_dbg_root,
> > +			      &ei->buf->datum_len);
> > +	debugfs_create_size_t("ts_buffer_watermark", 0444, ei->ts_dbg_root,
> > +			      &ei->buf->watermark);
> > +	debugfs_create_atomic_t("dropped_timestamps", 0444, ei->ts_dbg_root,
> > +				&ei->dropped_ts);
> > +}
> > +
> > +static inline void hte_dbgfs_deinit(struct dentry *root)
> > +{
> > +	if (!root)
> > +		return;
> > +
> > +	debugfs_remove_recursive(root);
> > +}
> > +
> > +#else
> > +
> > +static void hte_chip_dbgfs_init(struct hte_device *gdev)
> > +{
> > +}
> > +
> > +static void hte_ts_dbgfs_init(const char *name, struct hte_ts_info *ei)
> > +{
> > +}
> > +
> > +static inline void hte_dbgfs_deinit(struct dentry *root)
> > +{
> > +}
> > +
> > +#endif
> > +/* end of debugfs management*/
> > +
> > +/* Driver APIs */
> > +
> > +/**
> > + * hte_release_ts() - Consumer calls this API to release the entity, where
> > + * entity could be anything providers support, like lines, signals, buses,
> > + * etc...
> > + *
> > + * The correct sequence to call this API is as below:
> > + * 1) Call hte_disable_ts, this stops the timestamp push from the provider.
> > + * 2) Retrieve timestamps by calling non blocking hte_retrieve_ts_ns API if you
> > + * still care about the data.
> > + * 3) Call this API.
> > + * Above sequence makes sure that entity gets released race free.
> > + *
> > + * @desc: timestamp descriptor, this is the same as returned by the request API.
> > + *
> > + * Context: hte_dbgfs_deinit() function call may use sleeping locks,
> > + *	    not suitable from atomic context in that case.
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +int hte_release_ts(struct hte_ts_desc *desc)
> > +{
> > +	u32 id;
> > +	int ret = 0;
> > +	struct hte_device *gdev;
> > +	struct hte_ts_info *ei;
> > +	struct hte_ts_buf *buf;
> > +
> > +	if (!desc)
> > +		return -EINVAL;
> > +
> > +	ei = (struct hte_ts_info *)desc->data_subsys;  
> 
> As data_subsys is void * you don't need to explicitly cast it to another pointer type.
> 
> > +
> > +	if (!ei || !ei->gdev || !ei->buf)
> > +		return -EINVAL;
> > +
> > +	gdev = ei->gdev;
> > +	buf = ei->buf;
> > +	id = desc->con_id;
> > +
> > +	if (!test_bit(HTE_TS_REGISTERED, &ei->flags)) {
> > +		dev_info(gdev->sdev, "id:%d is not registered", id);
> > +		return -EUSERS;
> > +	}
> > +
> > +	ret = gdev->chip->ops->release(gdev->chip, ei->xlated_id);
> > +	if (ret) {
> > +		dev_err(gdev->sdev, "id: %d free failed\n", id);
> > +		goto out;
> > +	}
> > +
> > +	atomic_dec(&gdev->ts_req);
> > +	atomic_set(&ei->dropped_ts, 0);
> > +
> > +	kfree(desc->name);
> > +	kfree(desc);
> > +	ei->desc = NULL;
> > +	ei->seq = 0;
> > +	buf->access->release(buf);
> > +
> > +	hte_dbgfs_deinit(ei->ts_dbg_root);
> > +	module_put(gdev->owner);
> > +
> > +	clear_bit(HTE_TS_REGISTERED, &ei->flags);
> > +
> > +out:
> > +	dev_dbg(gdev->sdev, "%s: id: %d\n", __func__, id);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(hte_release_ts);
> > +
> > +static int hte_ts_dis_en_common(struct hte_ts_desc *desc, bool en)
> > +{
> > +	u32 ts_id;
> > +	struct hte_device *gdev;
> > +	struct hte_ts_info *ei;
> > +	int ret;
> > +
> > +	if (!desc)
> > +		return -EINVAL;
> > +
> > +	ei = (struct hte_ts_info *)desc->data_subsys;  
> 
> As above, no need to cast - though it rather implies the type of data_subsys
> should not be void *.
> 
> > +
> > +	if (!ei || !ei->gdev)
> > +		return -EINVAL;
> > +
> > +	gdev = ei->gdev;
> > +	ts_id = desc->con_id;
> > +
> > +	mutex_lock(&ei->mlock);
> > +
> > +	if (!test_bit(HTE_TS_REGISTERED, &ei->flags)) {
> > +		dev_dbg(gdev->sdev, "id:%d is not registered", ts_id);
> > +		ret = -EUSERS;
> > +		goto out;
> > +	}
> > +
> > +	if (en) {
> > +		if (!test_bit(HTE_TS_DISABLE, &ei->flags)) {
> > +			ret = 0;
> > +			goto out;
> > +		}
> > +		ret = gdev->chip->ops->enable(gdev->chip, ei->xlated_id);
> > +		if (ret) {
> > +			dev_warn(gdev->sdev, "id: %d enable failed\n",
> > +				 ts_id);
> > +			goto out;
> > +		}
> > +
> > +		clear_bit(HTE_TS_DISABLE, &ei->flags);
> > +		ret = 0;  
> 
> ret is already 0 so no point in setting it again.
> 
> > +	} else {
> > +		if (test_bit(HTE_TS_DISABLE, &ei->flags)) {
> > +			ret = 0;
> > +			goto out;
> > +		}
> > +		ret = gdev->chip->ops->disable(gdev->chip, ei->xlated_id);
> > +		if (ret) {
> > +			dev_warn(gdev->sdev, "id: %d disable failed\n",
> > +				 ts_id);
> > +			goto out;
> > +		}
> > +
> > +		set_bit(HTE_TS_DISABLE, &ei->flags);
> > +		ret = 0;
> > +	}
> > +
> > +out:
> > +	mutex_unlock(&ei->mlock);
> > +	return ret;
> > +}
> > +
> > +/**
> > + * hte_disable_ts() - Disable timestamp on given descriptor.
> > + *
> > + * @desc: ts descriptor, this is the same as returned by the request API.
> > + *
> > + * Context: Holds mutex lock, not suitable from atomic context.
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +int hte_disable_ts(struct hte_ts_desc *desc)
> > +{
> > +	return hte_ts_dis_en_common(desc, false);
> > +}
> > +EXPORT_SYMBOL_GPL(hte_disable_ts);
> > +
> > +/**
> > + * hte_enable_ts() - Enable timestamp on given descriptor.
> > + *
> > + * @desc: ts descriptor, this is the same as returned by the request API.
> > + *
> > + * Context: Holds mutex lock, not suitable from atomic context.
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +int hte_enable_ts(struct hte_ts_desc *desc)
> > +{
> > +	return hte_ts_dis_en_common(desc, true);
> > +}
> > +EXPORT_SYMBOL_GPL(hte_enable_ts);
> > +
> > +static int hte_simple_xlate(struct hte_chip *gc,
> > +			    const struct of_phandle_args *args,
> > +			    struct hte_ts_desc *desc,
> > +			    u32 *id)
> > +{
> > +	if (!id || !desc || !gc)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * For the providers which do not have any internal mappings between
> > +	 * logically exposed ids and actual ids, will set both
> > +	 * the same.
> > +	 *
> > +	 * In case there is a internal mapping needed, providers will need to
> > +	 * provide its own xlate function where con_id will be sent as
> > +	 * args[0] and it will return xlated id. Later xlated id will be
> > +	 * used for any future exchanges between provider and subsystems.
> > +	 */
> > +
> > +	if (args) {
> > +		if (gc->of_hte_n_cells < 1)
> > +			return -EINVAL;
> > +
> > +		if (args->args_count != gc->of_hte_n_cells)
> > +			return -EINVAL;
> > +
> > +		*id = args->args[0];
> > +		desc->con_id = *id;
> > +	} else {
> > +		*id = desc->con_id;
> > +	}
> > +
> > +	if (desc->con_id > gc->nlines)
> > +		return -EINVAL;
> > +
> > +	desc->data_subsys = NULL;
> > +
> > +	return 0;
> > +}
> > +
> > +static struct hte_device *of_node_to_htedevice(struct device_node *np)
> > +{
> > +	struct hte_device *gdev;
> > +
> > +	spin_lock(&hte_lock);
> > +
> > +	list_for_each_entry(gdev, &hte_devices, list)
> > +		if (gdev->chip && gdev->chip->dev &&
> > +		    gdev->chip->dev->of_node == np) {
> > +			spin_unlock(&hte_lock);
> > +			return gdev;
> > +		}
> > +
> > +	spin_unlock(&hte_lock);
> > +
> > +	return ERR_PTR(-ENODEV);
> > +}
> > +
> > +static int ___hte_req_ts(struct hte_device *gdev, struct hte_ts_desc *desc,
> > +			 u32 xlated_id, void (*cb)(enum hte_notify n))
> > +{
> > +	struct hte_ts_info *ei;
> > +	struct hte_ts_buf *buf;
> > +	int ret;
> > +	u32 con_id = desc->con_id;
> > +
> > +	if (!try_module_get(gdev->owner))
> > +		return -ENODEV;
> > +
> > +	ei = &gdev->ei[xlated_id];
> > +	ei->xlated_id = xlated_id;
> > +
> > +	/*
> > +	 * There a chance that multiple consumers requesting same entity,
> > +	 * lock here.
> > +	 */
> > +	mutex_lock(&ei->mlock);
> > +
> > +	if (test_bit(HTE_TS_REGISTERED, &ei->flags)) {
> > +		dev_dbg(gdev->chip->dev, "id:%u is already registered",
> > +			xlated_id);
> > +		ret = -EUSERS;
> > +		goto unlock;
> > +	}
> > +
> > +	buf = hte_ts_buf_allocate();
> > +	if (IS_ERR(buf)) {
> > +		dev_err(gdev->chip->dev, "Buffer allocation failed");
> > +		ret = PTR_ERR(buf);
> > +		goto unlock;
> > +	}
> > +
> > +	/* Set default here, let consumer decide how much to set later */
> > +	ret = buf->access->set_length(buf, HTE_EV_FIFO_EL,
> > +				      sizeof(struct hte_ts_data));
> > +  
> 
> It's good to keep to consistent style of no line break between a statement
> and it's error check.
> 
> > +	if (ret) {
> > +		dev_err(gdev->chip->dev, "Fifo set length failed");
> > +		goto buf_rel;
> > +	}
> > +
> > +	buf->access->reset(buf);
> > +	buf->valid = true;
> > +
> > +	ei->buf = buf;
> > +	ei->cb = cb;
> > +
> > +	ret = gdev->chip->ops->request(gdev->chip, xlated_id);
> > +	if (ret < 0) {
> > +		dev_err(gdev->chip->dev, "ts request failed\n");
> > +		goto buf_rel;
> > +	}
> > +
> > +	desc->data_subsys = ei;
> > +	ei->desc = desc;
> > +
> > +	atomic_inc(&gdev->ts_req);
> > +	set_bit(HTE_TS_REGISTERED, &ei->flags);
> > +	mutex_unlock(&ei->mlock);
> > +
> > +	if (!desc->name) {
> > +		desc->name = kzalloc(HTE_TS_NAME_LEN, GFP_KERNEL);
> > +		if (desc->name)
> > +			scnprintf(desc->name, HTE_TS_NAME_LEN, "ts_%u",
> > +				  con_id);
> > +	}
> > +
> > +	hte_ts_dbgfs_init(desc->name, ei);
> > +
> > +	dev_dbg(gdev->chip->dev, "%s: id: %u, xlated id:%u",
> > +		__func__, con_id, xlated_id);
> > +
> > +	return 0;
> > +
> > +buf_rel:
> > +	buf->access->release(buf);
> > +unlock:
> > +	module_put(gdev->owner);
> > +	mutex_unlock(&ei->mlock);
> > +
> > +	return ret;
> > +}
> > +
> > +static struct hte_device *of_hte_dev_get(struct device *dev,
> > +					 struct device_node *np,
> > +					 const char *label,
> > +					 struct of_phandle_args *args)
> > +{
> > +	struct hte_device *gdev = NULL;
> > +	int index = 0;
> > +	int err;
> > +
> > +	if (label) {
> > +		index = of_property_match_string(np, "hte-names", label);
> > +		if (index < 0)
> > +			return ERR_PTR(index);
> > +	}
> > +
> > +	err = of_parse_phandle_with_args(np, "htes", "#hte-cells", index,
> > +					 args);
> > +	if (err) {
> > +		pr_err("%s(): can't parse \"htes\" property\n", __func__);
> > +		return ERR_PTR(err);
> > +	}
> > +
> > +	gdev = of_node_to_htedevice(args->np);
> > +	if (IS_ERR(gdev)) {
> > +		pr_err("%s(): HTE chip not found\n", __func__);
> > +		of_node_put(args->np);
> > +		return gdev;
> > +	}
> > +
> > +	return gdev;
> > +}
> > +
> > +static struct hte_ts_desc *__hte_req_ts(struct device *dev,
> > +					struct device_node *np,
> > +					const char *label,
> > +					void (*cb)(enum hte_notify n))
> > +{
> > +	struct hte_device *gdev = NULL;
> > +	struct hte_ts_desc *desc;
> > +	struct of_phandle_args args;
> > +	int ret;
> > +	u32 xlated_id;
> > +
> > +	gdev = of_hte_dev_get(dev, np, label, &args);
> > +	if (IS_ERR(gdev))
> > +		return ERR_CAST(gdev);
> > +
> > +	if (!gdev->chip) {
> > +		pr_debug("requested id does not have provider\n");
> > +		return ERR_PTR(-ENODEV);
> > +	}
> > +
> > +	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
> > +	if (!desc)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ret = gdev->chip->xlate(gdev->chip, &args, desc, &xlated_id);
> > +	if (ret < 0)
> > +		goto put;
> > +
> > +	desc->name = NULL;
> > +	if (label)
> > +		desc->name = kstrdup(label, GFP_KERNEL);
> > +
> > +	ret = ___hte_req_ts(gdev, desc, xlated_id, cb);
> > +	if (ret < 0)
> > +		goto put;
> > +
> > +	return desc;
> > +
> > +put:
> > +	of_node_put(args.np);
> > +	kfree(desc);
> > +
> > +	return ERR_PTR(ret);
> > +}
> > +
> > +/**
> > + * of_hte_request_ts() - Consumer calls this API to request the HTE facility
> > + * on the specified entity, where entity is provider specific for example,
> > + * GPIO lines, signals, buses etc...
> > + *
> > + * @dev: Consumer device.
> > + * @label: Optional label.
> > + * @cb: Optional notify callback to consumer when data is pushed by the
> > + * provider.
> > + *
> > + * Context: Holds mutex lock, not suitable from atomic context.
> > + * Returns: Timestamp descriptor on success or error ptr on failure.
> > + */
> > +struct hte_ts_desc *of_hte_request_ts(struct device *dev,
> > +				      const char *label,
> > +				      void (*cb)(enum hte_notify n))
> > +{
> > +
> > +	if (dev && dev->of_node)
> > +		return __hte_req_ts(dev, dev->of_node, label, cb);
> > +	else
> > +		return ERR_PTR(-EOPNOTSUPP);
> > +}
> > +EXPORT_SYMBOL_GPL(of_hte_request_ts);
> > +
> > +static int devm_hte_ts_match_desc(struct device *dev, void *res, void *data)  
> 
> I'm not seeing what is devm about this.
> 
> > +{
> > +	struct hte_ts_desc **p = res;
> > +
> > +	if (WARN_ON(!p || !*p))
> > +		return 0;
> > +
> > +	return *p == data;
> > +}
> > +
> > +static void __devm_hte_release_ts(struct device *dev, void *res)
> > +{
> > +	hte_release_ts(*(struct hte_ts_desc **)res);
> > +}
> > +
> > +/**
> > + * devm_hte_release_ts() - Resource managed hte_release_ts().  
> 
> I'd not introduce this until you have a user.  It very rarely actually makes
> sense to call a devm release manually. Not having one makes people think harder
> about it.
> 
> > + * @dev: HTE consumer/client device.
> > + * @desc: HTE ts descriptor.
> > + *
> > + * Release timestamp functionality and its resources previously allocated using
> > + * of_hte_request_ts(). Calling this function is usually not needed because
> > + * devm-allocated resources are automatically released on driver detach.
> > + *
> > + * Context: Same as hte_release_ts() function.
> > + * Returns: 0 on success otherwise negative error code.
> > + */
> > +int devm_hte_release_ts(struct device *dev, struct hte_ts_desc *desc)
> > +{
> > +	return devres_release(dev, __devm_hte_release_ts,
> > +			      devm_hte_ts_match_desc, desc);
> > +}
> > +EXPORT_SYMBOL_GPL(devm_hte_release_ts);
> > +
> > +/**
> > + * devm_of_hte_request_ts() - Resource managed of_hte_request_ts().  
> 
> If it's kernel-doc it needs to give no warnings when you point the kernel-doc
> scripts at it.  They insist on full parameter documentation.
> 
> > + */
> > +struct hte_ts_desc *devm_of_hte_request_ts(struct device *dev,
> > +					   const char *label,
> > +					   void (*cb)(enum hte_notify n))
> > +{
> > +
> > +	struct hte_ts_desc **ptr, *desc;
> > +
> > +	ptr = devres_alloc(__devm_hte_release_ts, sizeof(*ptr), GFP_KERNEL);  
> 
> Superficially looks like you might get way with just calling dev_add_action_or_reset() in here
> and avoid this boilerplate.  A lot of cases that looked like this got cleaned up in the
> last kernel cycle.
> 
> 
> > +	if (!ptr)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	desc = of_hte_request_ts(dev, label, cb);
> > +	if (!IS_ERR(desc)) {
> > +		*ptr = desc;
> > +		devres_add(dev, ptr);
> > +	} else {
> > +		devres_free(ptr);
> > +	}
> > +	return desc;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_of_hte_request_ts);
> > +
> > +static struct hte_ts_info *hte_para_check(const struct hte_ts_desc *desc,
> > +					  size_t val)  
> 
> Not a good name or indeed combination of different things.
> hte_desc_to_info() and some separate check on val would be better.
> 
> > +{
> > +	struct hte_ts_info *ei;
> > +
> > +	if (!desc || !desc->data_subsys || !val) {
> > +		pr_debug("%s:%d: val :%lu\n", __func__, __LINE__, val);
> > +		return NULL;
> > +	}
> > +
> > +	ei = desc->data_subsys;
> > +	if (!ei || !ei->buf) {
> > +		pr_debug("%s:%d\n", __func__, __LINE__);
> > +		return NULL;
> > +	}
> > +
> > +	return ei;
> > +}
> > +
> > +static inline bool hte_ts_buf_wait(struct hte_ts_buf *buffer, size_t to_read)
> > +{
> > +	size_t el_avail;
> > +
> > +	el_avail = buffer->access->el_available(buffer);
> > +
> > +	return (el_avail >= to_read) ? false : true;  
> 
> return el_avail < to_read;
> 
> > +}
> > +
> > +static int _hte_retrieve_ts_ns(const struct hte_ts_desc *desc,
> > +			       struct hte_ts_data *el, size_t n, bool block)
> > +{
> > +	struct hte_ts_buf *buffer;
> > +	struct hte_ts_info *ei;
> > +	int ret;
> > +	size_t to_read, copied;
> > +
> > +	ei = hte_para_check(desc, n);
> > +	if (!ei)
> > +		return -EINVAL;
> > +
> > +	buffer = ei->buf;
> > +
> > +	to_read = min_t(size_t, n, buffer->watermark);  
> 
> Needs a comment as not obvious why you'd read the min of that requested or
> the watermark if there might be more available.
> 
> > +
> > +	do {
> > +		if (hte_ts_buf_wait(buffer, to_read)) {
> > +			if (!block) {
> > +				/* Possibly early here to retrieve, try again */
> > +				dev_dbg(ei->gdev->chip->dev, "%s: %d\n",
> > +					__func__, ret);
> > +				return -EAGAIN;
> > +			}
> > +			ret = wait_event_interruptible(buffer->pollq,
> > +					!hte_ts_buf_wait(buffer, to_read));
> > +			if (ret)
> > +				return ret;
> > +		}
> > +		ret = buffer->access->read(buffer, (void *)el,  
> 
> If you have to cast to a void * that usually means something is wrong in your definitions.
> Why is it needed here?  Looks like read has an inappropriate definition.
> 
> > +					   n * buffer->bytes_per_datum,
> > +					   &copied);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		if (copied > 0)
> > +			return 0;
> > +		else if (copied == 0 && !block)
> > +			return -EAGAIN;
> > +	} while (copied == 0);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * hte_retrieve_ts_ns() - Consumer calls this API to retrieve timestamp in
> > + * nano seconds i.e. el->tsc will be in ns.
> > + *
> > + * @desc: ts descriptor, same as returned from request API.
> > + * @el: buffer to store the timestamp details.
> > + * @n: Number of struct hte_timestamp_el elements.
> > + *
> > + * Context: Can be called from the atomic context.
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +int hte_retrieve_ts_ns(const struct hte_ts_desc *desc,
> > +		       struct hte_ts_data *el, size_t n)
> > +{
> > +	return _hte_retrieve_ts_ns(desc, el, n, false);
> > +}
> > +EXPORT_SYMBOL_GPL(hte_retrieve_ts_ns);
> > +
> > +/**
> > + * hte_retrieve_ts_ns_wait() - Blocking version of the hte_retrieve_ts_ns.
> > + * @desc: ts descriptor, same as returned from request API.
> > + * @el: buffer to store the timestamp data.
> > + * @n: Number of struct hte_ts_data data.
> > + *
> > + * Context: Can not be called from the atomic context.
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +int hte_retrieve_ts_ns_wait(const struct hte_ts_desc *desc,
> > +			    struct hte_ts_data *el, size_t n)
> > +{
> > +	return _hte_retrieve_ts_ns(desc, el, n, true);
> > +}
> > +EXPORT_SYMBOL_GPL(hte_retrieve_ts_ns_wait);
> > +
> > +/**
> > + * hte_set_buf_len() - Consumer calls this API to set timestamp software buffer
> > + * depth.
> > + *
> > + * @desc: ts descriptor, same as returned from request API.
> > + * @len: New length/depth.
> > + *
> > + * The correct sequence to set buffer length is as below:
> > + * 1) Disable timestamp by calling hte_disable_ts API.
> > + * 2) Optionally retrieve all the timestamps by calling non blocking
> > + *    hte_retrieve_ts_ns() API. This step only needed if you still care about
> > + *    the data.
> > + * 3) Call this API.
> > + * 4) Enable timestamp by calling hte_enable_ts API.
> > + *
> > + * This API destroys previously allocated buffer and creates new one, because
> > + * of that, it is mandatory to follow above sequence to make sure there is no
> > + * race between various other APIs in the subsystem.  
> 
> Good docs.  This is why I mentioned in review of docs patch that it is better
> to just have that refer to the kernel-doc in these files.  Keep all this good
> information in one place.
> 
> > + *
> > + * By default during the request API call, HTE subsystem allocates software
> > + * buffer with predefined length, this API gives flexibility to adjust the
> > + * length according to consumer's need.
> > + *
> > + * Context: Can not be called from atomic context.
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +int hte_set_buf_len(const struct hte_ts_desc *desc, size_t len)
> > +{
> > +	struct hte_ts_buf *buffer;
> > +	struct hte_ts_info *ei;
> > +	int ret;
> > +
> > +	ei = hte_para_check(desc, len);
> > +	if (!ei)
> > +		return -EINVAL;
> > +
> > +	buffer = ei->buf;
> > +	ret = buffer->access->set_length(buffer, len,
> > +					 sizeof(struct hte_ts_data));
> > +	if (ret)
> > +		dev_err(ei->gdev->chip->dev, "%s: ret:%d\n", __func__, ret);  
> 
> Not point in printing things line __func__ manually in dev_err() etc.
> Dynamic debug includes that and gives far more information + control of this.
> 
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(hte_set_buf_len);
> > +
> > +/**
> > + * hte_get_buf_len() - Consumer calls this API to get timestamp software buffer
> > + * depth or length.
> > + *
> > + * @desc: ts descriptor, same as returned from request API.
> > + *
> > + * Context: Any context.
> > + * Returns: Positive length on success or 0 on failure.
> > + */
> > +size_t hte_get_buf_len(const struct hte_ts_desc *desc)
> > +{
> > +	struct hte_ts_buf *buffer;
> > +	struct hte_ts_info *ei;
> > +
> > +	ei = hte_para_check(desc, 1);
> > +	if (!ei)
> > +		return 0;
> > +
> > +	buffer = ei->buf;
> > +
> > +	return buffer->access->get_length(buffer);
> > +}
> > +EXPORT_SYMBOL_GPL(hte_get_buf_len);
> > +
> > +/**
> > + * hte_available_ts() - Returns total available timestamps.
> > + *
> > + * @desc: ts descriptor, same as returned from request API.
> > + *
> > + * The API helps consumers to pre-allocate its internal buffer required
> > + * during hte_retrieve_ts_ns call.
> > + *
> > + * Context: Any context.
> > + * Returns: Positive value if elements are available else 0. The value is
> > + * number of total available struct hte_timestamp_el elements available not
> > + * the size in bytes.
> > + */
> > +size_t hte_available_ts(const struct hte_ts_desc *desc)
> > +{
> > +	struct hte_ts_buf *buffer;
> > +	struct hte_ts_info *ei;
> > +
> > +	ei = hte_para_check(desc, 1);
> > +	if (!ei)
> > +		return 0;
> > +
> > +	buffer = ei->buf;
> > +
> > +	return buffer->access->el_available(buffer);
> > +}
> > +EXPORT_SYMBOL_GPL(hte_available_ts);
> > +
> > +/**
> > + * hte_set_buf_watermark() - Consumer calls this API to set timestamp software
> > + * buffer watermark. The correct sequence to call this API is as below:
> > + * 1) Disable timestamp by calling hte_disable_ts API.
> > + * 2) Call this API.
> > + * 3) Enable timestamp by calling hte_enable_ts API.
> > + *
> > + * @desc: ts descriptor, same as returned from request API.
> > + * @val: New watermark.
> > + *
> > + * By default during the request API call, HTE subsystem sets watermark as 1,
> > + * this API gives flexibility to adjust the watermark according to consumer's
> > + * need. The consumers will get notification through callback registered during
> > + * request API either when timestamp is dropped or watermark is reached or will
> > + * wait till watermark is reached. Refer hte_retrieve_ts_ns() and
> > + * hte_push_ts_ns_atomic() APIs to understand how watermark is used.
> > + *
> > + * Context: Any context.  
> 
> You have no way of knowing that as will depend on the driver - I'd definitely
> suggest not from atomic context, but then that would be crazy so you are better
>  off not documenting any specific requirement at all.
> 
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +int hte_set_buf_watermark(const struct hte_ts_desc *desc, size_t val)
> > +{
> > +	struct hte_ts_buf *buffer;
> > +	struct hte_ts_info *ei;
> > +	int ret;
> > +
> > +	ei = hte_para_check(desc, val);
> > +	if (!ei)
> > +		return -EINVAL;
> > +
> > +	buffer = ei->buf;
> > +	ret = buffer->access->set_watermark(buffer, val);
> > +	if (ret)
> > +		dev_dbg(ei->gdev->chip->dev, "%s: ret:%d\n", __func__, ret);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(hte_set_buf_watermark);
> > +
> > +/**
> > + * hte_get_buf_watermark() - Consumer calls this API to get software
> > + * buffer watermark.
> > + * @desc: ts descriptor, same as returned from request API.
> > + *
> > + * Context: Any context.
> > + * Returns: Positive current watermark on success or 0 on failure.
> > + */
> > +size_t hte_get_buf_watermark(const struct hte_ts_desc *desc)
> > +{
> > +	struct hte_ts_buf *buffer;
> > +	struct hte_ts_info *ei;
> > +
> > +	ei = hte_para_check(desc, 1);
> > +	if (!ei)
> > +		return 0;
> > +
> > +	buffer = ei->buf;
> > +
> > +	return buffer->access->get_watermark(buffer);
> > +}
> > +EXPORT_SYMBOL_GPL(hte_get_buf_watermark);
> > +
> > +/**
> > + * hte_req_ts_by_dt_node() - Request entity to monitor by passing HTE device
> > + * node directly, where meaning of the entity is provider specific, for example
> > + * lines, signals, GPIOs, buses etc...
> > + *
> > + * @of_node: HTE provider device node.
> > + * @id: entity id to monitor, this id belongs to HTE provider of_node.
> > + * @cb: Optional callback to notify.
> > + *
> > + * Context: Holds mutex lock, can not be called from atomic context.  
> 
> What mutex and why?  If it is one you can check is held even better.
> 
> > + * Returns: ts descriptor on success or error pointers.
> > + */
> > +struct hte_ts_desc *hte_req_ts_by_dt_node(struct device_node *of_node,
> > +					  unsigned int id,
> > +					  void (*cb)(enum hte_notify n))
> > +{
> > +	struct hte_device *gdev;
> > +	struct hte_ts_desc *desc;
> > +	int ret;
> > +	u32 xlated_id;
> > +
> > +	gdev = of_node_to_htedevice(of_node);
> > +	if (IS_ERR(gdev))
> > +		return ERR_PTR(-ENOTSUPP);
> > +
> > +	if (!gdev->chip || !gdev->chip->ops)
> > +		return ERR_PTR(-ENOTSUPP);
> > +
> > +	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
> > +	if (!desc) {
> > +		ret = -ENOMEM;
> > +		goto out_put_device;
> > +	}  
> 
> Pass a desc pointer into this function rather than allocating the structure
> in here.  That lets the caller embed that structure inside one of it's own
> structures if it wants to, resulting in fewer small allocations which is always good.
> 
> It's far from obvious that the caller needs to free desc.
> 
> > +
> > +	desc->con_id = id;
> > +	ret = gdev->chip->xlate(gdev->chip, NULL, desc, &xlated_id);
> > +	if (ret < 0) {
> > +		dev_err(gdev->chip->dev,
> > +			"failed to xlate id: %d\n", id);
> > +		goto out_free_desc;
> > +	}
> > +
> > +	ret = ___hte_req_ts(gdev, desc, xlated_id, cb);
> > +	if (ret < 0) {
> > +		dev_err(gdev->chip->dev,
> > +			"failed to request id: %d\n", id);
> > +		goto out_free_desc;
> > +	}
> > +
> > +	return desc;
> > +
> > +out_free_desc:
> > +	kfree(desc);
> > +
> > +out_put_device:
> > +	return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL_GPL(hte_req_ts_by_dt_node);
> > +
> > +/**
> > + * hte_get_clk_src_info() - Consumer calls this API to query clock source
> > + * information of the desc.
> > + *
> > + * @desc: ts descriptor, same as returned from request API.
> > + *
> > + * Context: Any context.
> > + * Returns: 0 on success else negative error code on failure.
> > + */
> > +int hte_get_clk_src_info(const struct hte_ts_desc *desc,
> > +			 struct hte_clk_info *ci)
> > +{
> > +	struct hte_chip *chip;
> > +	struct hte_ts_info *ei;
> > +
> > +	if (!desc || !desc->data_subsys || !ci) {
> > +		pr_debug("%s:%d\n", __func__, __LINE__);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ei = desc->data_subsys;
> > +	if (!ei || !ei->gdev || !ei->gdev->chip)
> > +		return -EINVAL;
> > +
> > +	chip = ei->gdev->chip;
> > +	if (!chip->ops->get_clk_src_info)
> > +		return -ENOTSUPP;
> > +
> > +	return chip->ops->get_clk_src_info(chip, ci);
> > +}
> > +EXPORT_SYMBOL_GPL(hte_get_clk_src_info);
> > +
> > +static inline void hte_add_to_device_list(struct hte_device *gdev)
> > +{
> > +	struct hte_device *prev;  
> 
> Needs to take an appropriate lock as you may have concurrent calls.
> 
> > +
> > +	if (list_empty(&hte_devices)) {
> > +		list_add_tail(&gdev->list, &hte_devices);  
> 
> Needs a comment. I've no idea why you might want to only add it if there were
> no other hte_devices already there.
> 
> > +		return;
> > +	}
> > +
> > +	prev = list_last_entry(&hte_devices, struct hte_device, list);  
> Why woud you do this?
> 
> > +	list_add_tail(&gdev->list, &hte_devices);
> > +}
> > +
> > +/**
> > + * hte_push_ts_ns_atomic() - Used by the provider to push timestamp in nano
> > + * seconds i.e data->tsc will be in ns, it is assumed that provider will be
> > + * using this API from its ISR or atomic context.
> > + *
> > + * @chip: The HTE chip, used during the registration.
> > + * @xlated_id: entity id understood by both subsystem and provider, usually this
> > + * is obtained from xlate callback during request API.
> > + * @data: timestamp data.
> > + * @n: Size of the data.
> > + *
> > + * Context: Atomic.
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +int hte_push_ts_ns_atomic(const struct hte_chip *chip, u32 xlated_id,
> > +			  struct hte_ts_data *data, size_t n)
> > +{
> > +	unsigned int ret;
> > +	bool notify;
> > +	size_t el_avail;
> > +	struct hte_ts_buf *buffer;
> > +	struct hte_ts_info *ei;
> > +
> > +	if (!chip || !data || !chip->gdev)
> > +		return -EINVAL;
> > +
> > +	if (xlated_id > chip->nlines)
> > +		return -EINVAL;
> > +
> > +	ei = &chip->gdev->ei[xlated_id];
> > +
> > +	if (!test_bit(HTE_TS_REGISTERED, &ei->flags) ||
> > +	    test_bit(HTE_TS_DISABLE, &ei->flags)) {
> > +		dev_dbg(chip->dev, "Unknown timestamp push\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* timestamp sequence counter, start from 0 */
> > +	data->seq = ei->seq++;
> > +
> > +	buffer = ei->buf;
> > +	el_avail = buffer->access->el_available(buffer);  
> 
> > +	ret = buffer->access->store(buffer, data, n);  
> 
> If we are doing this from the hte core, why is buffer definition in the scope of the
> drivers rather than the core?  That seems backwards to me.
> 
> > +	if (ret != n) {
> > +		atomic_inc(&ei->dropped_ts);
> > +		if (ei->cb)
> > +			ei->cb(HTE_TS_DROPPED);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	notify = ((el_avail + 1) >= buffer->watermark) ? true : false;  
> 
> You push n but only check on el_avail + 1 here.  
> Also, this is the same as
> 
> 	notify = ((el_avail + 1) >= buffer->watermark;
> 
> 
> > +
> > +	/*
> > +	 * If there is a callback, its consumer's job to retrieve the timestamp.
> > +	 * For the rest, wake up the process.
> > +	 */
> > +	if (notify && ei->cb) {
> > +		ei->cb(HTE_TS_AVAIL);
> > +		return 0;  
> 
> Given you return 0 anyway, might as well not have this line.
> 
> > +	} else if (notify) {
> > +		wake_up_interruptible(&buffer->pollq);
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(hte_push_ts_ns_atomic);
> > +
> > +/**
> > + * hte_register_chip() - Used by provider to register a HTE chip.
> > + * @chip: the HTE chip to add to subsystem.
> > + *
> > + * Context: Can not be called from atomic context.  
> 
> Whilst true, I'd think that was common sense as it would be insane
> to register something like this from atomic context.  So I'd say no
> need to comment on it!  Keep those comments for things that
> might be used like that.
> 
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +int hte_register_chip(struct hte_chip *chip)
> > +{
> > +	struct hte_device *gdev;
> > +	int ret;
> > +	u32 i;
> > +
> > +	if (!chip || !chip->dev || !chip->dev->of_node)
> > +		return -EINVAL;
> > +
> > +	if (!chip->ops || !chip->ops->request || !chip->ops->release) {
> > +		dev_err(chip->dev, "Driver needs to provide ops\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	gdev = kzalloc(sizeof(*gdev), GFP_KERNEL);
> > +	if (!gdev)
> > +		return -ENOMEM;
> > +
> > +	gdev->chip = chip;
> > +	chip->gdev = gdev;
> > +	gdev->nlines = chip->nlines;
> > +	gdev->sdev = chip->dev;
> > +
> > +	/*
> > +	 * Allocate all the supported entities here at once, this will have
> > +	 * following advantages:
> > +	 * When provider pushes timestamp, it can then just send the
> > +	 * xlated_id, subsystem will use it as an index which
> > +	 * gives us the constant time access; this is important as mostly
> > +	 * providers will be pushing the timestamps from their ISR.
> > +	 */
> > +	gdev->ei = kcalloc(chip->nlines, sizeof(struct hte_ts_info),
> > +			   GFP_KERNEL);  
> 
> I'd be tempted to do this as a 0 length element at the end of gdev
> then do the allocation in one go use struct_size() etc to work out
> how long it is.  Cuts down on allocations + error paths to deal with
> for no obvious disadvantage.
> 
> > +	if (!gdev->ei) {
> > +		ret = -ENOMEM;
> > +		goto err_free_gdev;
> > +	}
> > +
> > +	for (i = 0; i < chip->nlines; i++) {
> > +		gdev->ei[i].flags = 0;  
> 
> zero allocated, so don't bother setting things to 0 where it's a fairly obvious
> base state.  If you set something to 0 to act as some form of documentation then
> that's fine, but I don't think that's true here.
> 
> > +		gdev->ei[i].gdev = gdev;
> > +		gdev->ei[i].seq = 0;
> > +		mutex_init(&gdev->ei[i].mlock);
> > +	}
> > +
> > +	if (chip->dev->driver)
> > +		gdev->owner = chip->dev->driver->owner;
> > +	else
> > +		gdev->owner = THIS_MODULE;
> > +
> > +	if (!chip->xlate) {
> > +		chip->xlate = hte_simple_xlate;
> > +		/* Just a id number to monitor */
> > +		chip->of_hte_n_cells = 1;
> > +	}
> > +
> > +	of_node_get(chip->dev->of_node);
> > +
> > +	INIT_LIST_HEAD(&gdev->list);
> > +
> > +	spin_lock(&hte_lock);
> > +	hte_add_to_device_list(gdev);
> > +	spin_unlock(&hte_lock);
> > +
> > +	hte_chip_dbgfs_init(gdev);
> > +
> > +	dev_dbg(chip->dev, "Added hte chip\n");
> > +	return 0;
> > +
> > +err_free_gdev:
> > +	kfree(gdev);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(hte_register_chip);
> > +
> > +/**
> > + * hte_unregister_chip() - Used by the provider to remove a HTE chip.
> > + * @chip: the HTE chip to remove.
> > + *
> > + * Context: Can not be called from atomic context.
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +int hte_unregister_chip(struct hte_chip *chip)
> > +{
> > +	struct hte_device *gdev = chip->gdev;
> > +
> > +	spin_lock(&hte_lock);
> > +	list_del(&gdev->list);
> > +	spin_unlock(&hte_lock);
> > +
> > +	gdev->chip = NULL;
> > +
> > +	of_node_put(chip->dev->of_node);
> > +	hte_dbgfs_deinit(gdev->dbg_root);
> > +	kfree(gdev->ei);
> > +	kfree(gdev);
> > +
> > +	dev_dbg(chip->dev, "Removed hte chip\n");
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(hte_unregister_chip);
> > +
> > +/* Driver APIs ends */  
> 
> Don't bother with file layout type comments.  They don't add that much and tend
> to rot horribly over time as people move code around in files.
> 
> > diff --git a/include/linux/hte.h b/include/linux/hte.h
> > new file mode 100644
> > index 000000000000..e1737579d4c4
> > --- /dev/null
> > +++ b/include/linux/hte.h
> > @@ -0,0 +1,278 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 NVIDIA Corporation
> > + *
> > + * Author: Dipen Patel <dipenp@nvidia.com>
> > + */
> > +
> > +#ifndef __LINUX_HTE_H
> > +#define __LINUX_HTE_H
> > +
> > +struct hte_chip;
> > +struct hte_device;
> > +struct of_phandle_args;
> > +
> > +/**
> > + * Used by providers to indicate the direction of the timestamp.
> > + */
> > +#define HTE_EVENT_RISING_EDGE          0x1
> > +#define HTE_EVENT_FALLING_EDGE         0x2  
> 
> Use an enum rather than a define for this as it's a value that can take a
> set of distinct values.  Also, provide a name for 'I've no idea' which
> I'm guessing is 0 currently.
> 
> > +
> > +/**
> > + * struct hte_ts_data - HTE timestamp data.
> > + * The provider uses and fills timestamp related details during push_timestamp
> > + * API call. The consumer uses during retrieve_timestamp API call.
> > + *
> > + * @tsc: Timestamp value.
> > + * @seq: Sequence counter of the timestamps.
> > + * @dir: Direction of the event at the time of timestamp.
> > + */
> > +struct hte_ts_data {
> > +	u64 tsc;
> > +	u64 seq;
> > +	int dir;
> > +};
> > +
> > +/**
> > + * struct hte_clk_info - Clock source info that HTE provider uses.
> > + * The provider uses hardware clock as a source to timestamp real time. This
> > + * structure presents the clock information to consumers. 
> > + *
> > + * @hz: Clock rate in HZ, for example 1KHz clock = 1000.
> > + * @type: Clock type. CLOCK_* types.  
> 
> So this is something we got a it wrong in IIO. It's much better to define
> a subset of clocks that can be potentially used.  There are some that make
> absolutely no sense and consumers really don't want to have to deal with them.
>  
> > + */
> > +struct hte_clk_info {
> > +	u64 hz;
> > +	clockid_t type;
> > +};
> > +
> > +/**
> > + * HTE subsystem notifications for the consumers.
> > + *
> > + * @HTE_TS_AVAIL: Timestamps available notification.
> > + * @HTE_TS_DROPPED: Timestamps dropped notification.  
> 
> Something I've missed so far is whether drops are in a kfifo or a ring
> fashion.  I'm guess that's stated somewhere, but it might be useful to have
> it here.
> 
> > + */
> > +enum hte_notify {
> > +	HTE_TS_AVAIL = 1,
> > +	HTE_TS_DROPPED,
> > +	HTE_NUM_NOTIFIER,
> > +};
> > +
> > +/**
> > + * struct hte_ts_desc - HTE timestamp descriptor, this structure will be
> > + * communication token between consumers to subsystem and subsystem to
> > + * providers.
> > + *
> > + * @con_id: This is the same id sent in request APIs.
> > + * @name: Descriptive name of the entity that is being monitored for the
> > + * realtime timestamping.
> > + * @data_subsys: Subsystem's private data relate to requested con_id.
> > + */
> > +struct hte_ts_desc {
> > +	u32 con_id;
> > +	char *name;
> > +	void *data_subsys;
> > +};
> > +
> > +/**
> > + * struct hte_ops - HTE operations set by providers.
> > + *
> > + * @request: Hook for requesting a HTE timestamp. Returns 0 on success,
> > + * non-zero for failures.
> > + * @release: Hook for releasing a HTE timestamp. Returns 0 on success,
> > + * non-zero for failures.
> > + * @enable: Hook to enable the specified timestamp. Returns 0 on success,
> > + * non-zero for failures.
> > + * @disable: Hook to disable specified timestamp. Returns 0 on success,
> > + * non-zero for failures.
> > + * @get_clk_src_info: Optional hook to get the clock information provider uses
> > + * to timestamp. Returns 0 for success and negative error code for failure. On
> > + * success HTE subsystem fills up provided struct hte_clk_info.  
> 
> Why optional?  Consumers will probably need that information.
> 
> > + *
> > + * xlated_id parameter is used to communicate between HTE subsystem and the
> > + * providers. It is the same id returned during xlate API call and translated
> > + * by the provider. This may be helpful as both subsystem and provider locate
> > + * the requested entity in constant time, where entity could be anything from
> > + * lines, signals, events, buses etc.. that providers support.
> > + */
> > +struct hte_ops {
> > +	int (*request)(struct hte_chip *chip, u32 xlated_id);
> > +	int (*release)(struct hte_chip *chip, u32 xlated_id);
> > +	int (*enable)(struct hte_chip *chip, u32 xlated_id);
> > +	int (*disable)(struct hte_chip *chip, u32 xlated_id);
> > +	int (*get_clk_src_info)(struct hte_chip *chip,
> > +				struct hte_clk_info *ci);
> > +};
> > +
> > +/**
> > + * struct hte_chip - Abstract HTE chip structure.
> > + * @name: functional name of the HTE IP block.
> > + * @dev: device providing the HTE.  
> 
> Unclear naming.  Is this the parent device, or one associated with the HTE itself?
> I'm guessing today you don't have one associated with the HTE, but it is plausible you
> might gain on in future to make it fit nicely in the device model as a function of another
> device.
> 
> > + * @ops: callbacks for this HTE.
> > + * @nlines: number of lines/signals supported by this chip.
> > + * @xlate: Callback which translates consumer supplied logical ids to
> > + * physical ids, return from 0 for the success and negative for the
> > + * failures. It stores (0 to @nlines) in xlated_id parameter for the success.
> > + * @of_hte_n_cells: Number of cells used to form the HTE specifier.
> > + * @gdev: HTE subsystem abstract device, internal to the HTE subsystem.
> > + * @data: chip specific private data.
> > + */
> > +struct hte_chip {
> > +	const char *name;
> > +	struct device *dev;
> > +	const struct hte_ops *ops;
> > +	u32 nlines;
> > +	int (*xlate)(struct hte_chip *gc,
> > +		     const struct of_phandle_args *args,
> > +		     struct hte_ts_desc *desc, u32 *xlated_id);
> > +	u8 of_hte_n_cells;
> > +
> > +	/* only used internally by the HTE framework */
> > +	struct hte_device *gdev;
> > +	void *data;
> > +};
> > +
> > +#if IS_ENABLED(CONFIG_HTE)
> > +/* HTE APIs for the providers */
> > +int hte_register_chip(struct hte_chip *chip);
> > +int hte_unregister_chip(struct hte_chip *chip);
> > +int hte_push_ts_ns_atomic(const struct hte_chip *chip, u32 xlated_id,
> > +			  struct hte_ts_data *data, size_t n);
> > +
> > +/* HTE APIs for the consumers */
> > +
> > +int hte_release_ts(struct hte_ts_desc *desc);
> > +struct hte_ts_desc *of_hte_request_ts(struct device *dev, const char *label,
> > +				      void (*cb)(enum hte_notify n));
> > +
> > +struct hte_ts_desc *devm_of_hte_request_ts(struct device *dev,
> > +					   const char *label,
> > +					   void (*cb)(enum hte_notify n));
> > +struct hte_ts_desc *hte_req_ts_by_dt_node(struct device_node *of_node,
> > +					  unsigned int id,
> > +					  void (*cb)(enum hte_notify n));
> > +int devm_hte_release_ts(struct device *dev, struct hte_ts_desc *desc);
> > +int hte_retrieve_ts_ns(const struct hte_ts_desc *desc, struct hte_ts_data *el,
> > +		       size_t n);
> > +int hte_retrieve_ts_ns_wait(const struct hte_ts_desc *desc,
> > +			    struct hte_ts_data *el, size_t n);
> > +int hte_set_buf_len(const struct hte_ts_desc *desc, size_t len);
> > +size_t hte_get_buf_len(const struct hte_ts_desc *desc);
> > +int hte_set_buf_watermark(const struct hte_ts_desc *desc, size_t val);
> > +size_t hte_get_buf_watermark(const struct hte_ts_desc *desc);
> > +size_t hte_available_ts(const struct hte_ts_desc *desc);
> > +int hte_enable_ts(struct hte_ts_desc *desc);
> > +int hte_disable_ts(struct hte_ts_desc *desc);
> > +int hte_get_clk_src_info(const struct hte_ts_desc *desc,
> > +			 struct hte_clk_info *ci);
> > +
> >  
> 

