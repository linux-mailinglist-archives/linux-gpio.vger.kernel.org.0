Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2505C3594F4
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 07:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhDIFtB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 01:49:01 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:57225 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229613AbhDIFtA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 01:49:00 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id B07C95807C9;
        Fri,  9 Apr 2021 01:48:47 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Fri, 09 Apr 2021 01:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=/TVilphQxUnwmONvKKfXy/hpcZLrBLQ
        Sam274NUliIA=; b=EycFG932WuI+JvF6G0D0D2qOgYkT/VTUrz53p0DeJ3CeTAh
        PVf6yTFDqEe2yZtVLFU1Hp5JTajeMDPq1SPi+F8BFJFBYxSrsd/gmveBHciiijQl
        dl+aEU6c9U7wJ7PKH9+hIZpjR9hmkZcSCmr3w0wkJORlEJ8W28DcS4f+LDkvKndl
        +7eTBwtm7TqS9xGEr6ayqlDHxH4q1EPZecb04jpoqlHkByKb77JaU60/oUx57WtA
        IZjpPWEXAg19SWJVKLbvCF7KFBTghmr0BQzoUMcmA4dlGtfUuASwQn49VnI7mfdU
        9EekQjDTC9J51pemamXQlrXKheiH1vnE/7vxfgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/TVilp
        hQxUnwmONvKKfXy/hpcZLrBLQSam274NUliIA=; b=qrMvZHO3i8pAkcwpwxgGC+
        XEMuzBG8K62P9KR0X8PicTp0gT2tZ2hHKJQ+ukRA0nCCqvTGvrNCnurLTgoHMvUs
        +/Mk/9uKM1fKR4pZHVr1IMuA0/p5Mp0ERruAQsbmpHmgf/z0EmG9IOVIpPdhjMj1
        PcpIMCqssXFXws85J4Dh2kPKV7G2+IKQZHSJ4N0oIVPQuRxj7N2uvyLS4LeumHT2
        1W0XzBf95j4uzeHnOiGyNEu84xvC3c4AU5PdkzqR4hLmA7VHV7DwL5L4HzroG28A
        IFQmD6YP9a63ygx/GCEQKK8UdsJh6TnNzrLw50wLmqzl9VvEXziC7Ue2MGGizHsA
        ==
X-ME-Sender: <xms:vupvYBKmHXqQ6Dt5RhkXY8gKlYEXJARYBXnRjnWAvpuEvuRHd4ymMg>
    <xme:vupvYNL9YZ6k5-hpt9JOGBDlwEt_tYv2gXrrK6a0nqC2mZPqNCh3t-HeNRDrkqgmm
    wj4k8pc_MyGDcx1FQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:vupvYJsWvIqecZN2SxvPx6G4YtNPzA-AFjHa0Xl943RYB3lyXxVEjw>
    <xmx:vupvYCZOLJRBH8azGdFkm02ZPM18_ek9KYwa2EuqbtWsI1VQEcBxvA>
    <xmx:vupvYIYuXyB9MaFLTl7JKdW7yEv_4nDTzWX0aEfh8y1s9r_MkhNeWg>
    <xmx:v-pvYIK_HLm98BmpPXizl_7ujVh2FaA-JnBSua0AwEjuqDgfoeiHMA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C87B4A0007C; Fri,  9 Apr 2021 01:48:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <6aa7c000-da09-4058-96b4-f330193c7fc6@www.fastmail.com>
In-Reply-To: <YG/QUCIdEzW1ghVA@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-9-andrew@aj.id.au> <YG/QUCIdEzW1ghVA@packtop>
Date:   Fri, 09 Apr 2021 15:18:21 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Zev Weiss" <zweiss@equinix.com>
Cc:     "openipmi-developer@lists.sourceforge.net" 
        <openipmi-developer@lists.sourceforge.net>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "Corey Minyard" <minyard@acm.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Tomer Maimon" <tmaimon77@gmail.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "Avi Fishman" <avifishman70@gmail.com>,
        "Patrick Venture" <venture@google.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Tali Perry" <tali.perry1@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "Benjamin Fair" <benjaminfair@google.com>
Subject: Re: [PATCH v2 09/21] ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 9 Apr 2021, at 13:26, Zev Weiss wrote:
> On Fri, Mar 19, 2021 at 01:27:40AM CDT, Andrew Jeffery wrote:
> >Take steps towards defining a coherent API to separate the KCS device
> >drivers from the userspace interface. Decreasing the coupling will
> >improve the separation of concerns and enable the introduction of
> >alternative userspace interfaces.
> >
> >For now, simply split the chardev logic out to a separate file. The code
> >continues to build into the same module.
> >
> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >---
> > drivers/char/ipmi/Makefile            |   2 +-
> > drivers/char/ipmi/kcs_bmc.c           | 423 +------------------------
> > drivers/char/ipmi/kcs_bmc.h           |  10 +-
> > drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 428 ++++++++++++++++++++++++++
> > 4 files changed, 451 insertions(+), 412 deletions(-)
> > create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> >
> >diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> >index 0822adc2ec41..a302bc865370 100644
> >--- a/drivers/char/ipmi/Makefile
> >+++ b/drivers/char/ipmi/Makefile
> >@@ -22,7 +22,7 @@ obj-$(CONFIG_IPMI_SSIF) += ipmi_ssif.o
> > obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
> > obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
> > obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
> >-obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
> >+obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o kcs_bmc_cdev_ipmi.o
> > obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
> > obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
> > obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
> >diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> >index c4336c1f2d6d..ef5c48ffe74a 100644
> >--- a/drivers/char/ipmi/kcs_bmc.c
> >+++ b/drivers/char/ipmi/kcs_bmc.c
> >@@ -3,446 +3,51 @@
> >  * Copyright (c) 2015-2018, Intel Corporation.
> >  */
> >
> >-#define pr_fmt(fmt) "kcs-bmc: " fmt
> >-
> >-#include <linux/errno.h>
> >-#include <linux/io.h>
> >-#include <linux/ipmi_bmc.h>
> > #include <linux/module.h>
> >-#include <linux/platform_device.h>
> >-#include <linux/poll.h>
> >-#include <linux/sched.h>
> >-#include <linux/slab.h>
> >
> > #include "kcs_bmc.h"
> >
> >-#define DEVICE_NAME "ipmi-kcs"
> >-
> >-#define KCS_MSG_BUFSIZ    1000
> >-
> >-#define KCS_ZERO_DATA     0
> >-
> >-
> >-/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
> >-#define KCS_STATUS_STATE(state) (state << 6)
> >-#define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
> >-#define KCS_STATUS_CMD_DAT      BIT(3)
> >-#define KCS_STATUS_SMS_ATN      BIT(2)
> >-#define KCS_STATUS_IBF          BIT(1)
> >-#define KCS_STATUS_OBF          BIT(0)
> >-
> >-/* IPMI 2.0 - Table 9-2, KCS Interface State Bits */
> >-enum kcs_states {
> >-	IDLE_STATE  = 0,
> >-	READ_STATE  = 1,
> >-	WRITE_STATE = 2,
> >-	ERROR_STATE = 3,
> >-};
> >-
> >-/* IPMI 2.0 - Table 9-3, KCS Interface Control Codes */
> >-#define KCS_CMD_GET_STATUS_ABORT  0x60
> >-#define KCS_CMD_WRITE_START       0x61
> >-#define KCS_CMD_WRITE_END         0x62
> >-#define KCS_CMD_READ_BYTE         0x68
> >-
> >-static inline u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
> >+u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
> > {
> > 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
> > }
> >+EXPORT_SYMBOL(kcs_bmc_read_data);
> >
> >-static inline void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
> >+void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
> > {
> > 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
> > }
> >+EXPORT_SYMBOL(kcs_bmc_write_data);
> >
> >-static inline u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
> >+u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
> > {
> > 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
> > }
> >+EXPORT_SYMBOL(kcs_bmc_read_status);
> >
> >-static inline void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
> >+void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
> > {
> > 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
> > }
> >+EXPORT_SYMBOL(kcs_bmc_write_status);
> >
> >-static void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
> >+void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
> > {
> > 	kcs_bmc->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
> > }
> >+EXPORT_SYMBOL(kcs_bmc_update_status);
> >
> >-static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
> >-{
> >-	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
> >-					KCS_STATUS_STATE(state));
> >-}
> >-
> >-static void kcs_force_abort(struct kcs_bmc *kcs_bmc)
> >-{
> >-	set_state(kcs_bmc, ERROR_STATE);
> >-	kcs_bmc_read_data(kcs_bmc);
> >-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >-
> >-	kcs_bmc->phase = KCS_PHASE_ERROR;
> >-	kcs_bmc->data_in_avail = false;
> >-	kcs_bmc->data_in_idx = 0;
> >-}
> >-
> >-static void kcs_bmc_handle_data(struct kcs_bmc *kcs_bmc)
> >-{
> >-	u8 data;
> >-
> >-	switch (kcs_bmc->phase) {
> >-	case KCS_PHASE_WRITE_START:
> >-		kcs_bmc->phase = KCS_PHASE_WRITE_DATA;
> >-		fallthrough;
> >-
> >-	case KCS_PHASE_WRITE_DATA:
> >-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
> >-			set_state(kcs_bmc, WRITE_STATE);
> >-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
> >-						kcs_bmc_read_data(kcs_bmc);
> >-		} else {
> >-			kcs_force_abort(kcs_bmc);
> >-			kcs_bmc->error = KCS_LENGTH_ERROR;
> >-		}
> >-		break;
> >-
> >-	case KCS_PHASE_WRITE_END_CMD:
> >-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
> >-			set_state(kcs_bmc, READ_STATE);
> >-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
> >-						kcs_bmc_read_data(kcs_bmc);
> >-			kcs_bmc->phase = KCS_PHASE_WRITE_DONE;
> >-			kcs_bmc->data_in_avail = true;
> >-			wake_up_interruptible(&kcs_bmc->queue);
> >-		} else {
> >-			kcs_force_abort(kcs_bmc);
> >-			kcs_bmc->error = KCS_LENGTH_ERROR;
> >-		}
> >-		break;
> >-
> >-	case KCS_PHASE_READ:
> >-		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len)
> >-			set_state(kcs_bmc, IDLE_STATE);
> >-
> >-		data = kcs_bmc_read_data(kcs_bmc);
> >-		if (data != KCS_CMD_READ_BYTE) {
> >-			set_state(kcs_bmc, ERROR_STATE);
> >-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >-			break;
> >-		}
> >-
> >-		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len) {
> >-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >-			kcs_bmc->phase = KCS_PHASE_IDLE;
> >-			break;
> >-		}
> >-
> >-		kcs_bmc_write_data(kcs_bmc,
> >-			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
> >-		break;
> >-
> >-	case KCS_PHASE_ABORT_ERROR1:
> >-		set_state(kcs_bmc, READ_STATE);
> >-		kcs_bmc_read_data(kcs_bmc);
> >-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
> >-		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR2;
> >-		break;
> >-
> >-	case KCS_PHASE_ABORT_ERROR2:
> >-		set_state(kcs_bmc, IDLE_STATE);
> >-		kcs_bmc_read_data(kcs_bmc);
> >-		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >-		kcs_bmc->phase = KCS_PHASE_IDLE;
> >-		break;
> >-
> >-	default:
> >-		kcs_force_abort(kcs_bmc);
> >-		break;
> >-	}
> >-}
> >-
> >-static void kcs_bmc_handle_cmd(struct kcs_bmc *kcs_bmc)
> >-{
> >-	u8 cmd;
> >-
> >-	set_state(kcs_bmc, WRITE_STATE);
> >-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >-
> >-	cmd = kcs_bmc_read_data(kcs_bmc);
> >-	switch (cmd) {
> >-	case KCS_CMD_WRITE_START:
> >-		kcs_bmc->phase = KCS_PHASE_WRITE_START;
> >-		kcs_bmc->error = KCS_NO_ERROR;
> >-		kcs_bmc->data_in_avail = false;
> >-		kcs_bmc->data_in_idx = 0;
> >-		break;
> >-
> >-	case KCS_CMD_WRITE_END:
> >-		if (kcs_bmc->phase != KCS_PHASE_WRITE_DATA) {
> >-			kcs_force_abort(kcs_bmc);
> >-			break;
> >-		}
> >-
> >-		kcs_bmc->phase = KCS_PHASE_WRITE_END_CMD;
> >-		break;
> >-
> >-	case KCS_CMD_GET_STATUS_ABORT:
> >-		if (kcs_bmc->error == KCS_NO_ERROR)
> >-			kcs_bmc->error = KCS_ABORTED_BY_COMMAND;
> >-
> >-		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR1;
> >-		kcs_bmc->data_in_avail = false;
> >-		kcs_bmc->data_in_idx = 0;
> >-		break;
> >-
> >-	default:
> >-		kcs_force_abort(kcs_bmc);
> >-		kcs_bmc->error = KCS_ILLEGAL_CONTROL_CODE;
> >-		break;
> >-	}
> >-}
> >-
> >+int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc);
> 
> This declaration looks a bit out of place here; should it be in
> kcs_bmc.h instead?

These are only temporary and get removed later on in the series after 
some shuffling of the code.

Andrew
