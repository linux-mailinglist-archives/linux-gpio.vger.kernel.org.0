Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1C42D1E0E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 00:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgLGXEP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 18:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLGXEP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 18:04:15 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10D0C061749;
        Mon,  7 Dec 2020 15:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=q1rWMd+0bmuLKMjmUfpeFhBnzWtZkmB1pVE5t2ouoEQ=; b=MPuvzIQAkYZo6NKkowA47Hz/4i
        uGOYEbJCp0j2GmVrI/DHQ+6CRRmfjG/DEiCujZF0qcueLhGm8c9la1qJQfKWHjsTlozAcKiz4CNnU
        4a1qFs78PXt1/rlHT0VS9X51LDzJNELHwEdNyasUSfV2AX+P/ULj10FwXNC3ZIUOxqHcbl+KyRfOQ
        5IRLWUtQLjm3weYn1wTd/t9Iye1MmaTEk9pJLP+4IZhM/52+V/wyIPWtPWsO0UCMPnKJtB9GYtrMX
        7tdaaEhvgCx/b5jTlNoDc+ROh8F1oEXm+Pw2ghAUx4qYt+Km7r6GmADIjOBxUhpgkr2uSDh8OoO+L
        kj3gP0Xg==;
Received: from [2601:1c0:6280:3f0::1494]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kmPXX-0000yz-9N; Mon, 07 Dec 2020 23:03:31 +0000
Subject: Re: [PATCH v3] drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mst@redhat.com, jasowang@redhat.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201207204838.21406-1-info@metux.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ff4357f3-93f1-cd86-a1da-01dcb144e52b@infradead.org>
Date:   Mon, 7 Dec 2020 15:03:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207204838.21406-1-info@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/7/20 12:48 PM, Enrico Weigelt, metux IT consult wrote:
> Introducing new GPIO driver for virtual GPIO devices via virtio.

  Introduce

> 
> The driver allows routing GPIO control into VM guests, eg. brigding
> virtual gpios to specific host gpios, or attaching simulators for
> automatic application testing.
> 

These ...

> Changes v3:
>     * spec: fixed type names
>     * spec: replace "host"/"guest" by "device"/"cpu"
>     * spec: change terminology from "events" to "messages"
>     * driver: fixed missing can_sleep flag
>     * driver: select VIRTIO instead of depends on
>     * driver: drop references to qemu in Kconfig
>     * driver: fixed incomplete error handling and possible deadlock
>               in case of sending buf failed
>     * driver: dropped unneeded WARN_ON
>     * driver: fixed retval of virtio_gpio_xmit()
>     * driver: dynamically allocate virtio buffers
>     * driver: added locking on gpio operations
>     * driver: added irq_chip functions
> 
> Changes v2:
>     * uapi: fixed header license
>     * driver: sorted include's
>     * driver: fixed formatting
>     * driver: fixed unneeded devm allocation - plain kzalloc/kfree is enough
>     * driver: fixed missing devm_kzalloc fail check
>     * driver: use devm_kcalloc() for array allocation
>     * spec: added virtio-gpio protocol specification

... Vx change descriptions go after the following "---" line.
I usually put them before the diffstat, with one blank line
separating them.

> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  Documentation/gpio/virtio-gpio.rst | 176 +++++++++++++++++
>  MAINTAINERS                        |   6 +
>  drivers/gpio/Kconfig               |   7 +
>  drivers/gpio/Makefile              |   1 +
>  drivers/gpio/gpio-virtio.c         | 381 +++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/virtio_gpio.h   |  39 ++++
>  include/uapi/linux/virtio_ids.h    |   1 +
>  7 files changed, 611 insertions(+)
>  create mode 100644 Documentation/gpio/virtio-gpio.rst
>  create mode 100644 drivers/gpio/gpio-virtio.c
>  create mode 100644 include/uapi/linux/virtio_gpio.h
> 
> diff --git a/Documentation/gpio/virtio-gpio.rst b/Documentation/gpio/virtio-gpio.rst
> new file mode 100644
> index 000000000000..e7bf01ec1ce7
> --- /dev/null
> +++ b/Documentation/gpio/virtio-gpio.rst
> @@ -0,0 +1,176 @@
> +"""""""""""""""""
> +Virtio-GPIO protocol specification
> +"""""""""""""""""
> +...........
> +Specification for virtio-based virtiual GPIO devices

                                  virtual
although it seems redundant.

> +...........
> +
> ++------------
> ++Version_ 1.0
> ++------------
> +
> +===================
> +General
> +===================
> +
> +The virtio-gpio protocol provides access to general purpose IO devices
> +to virtual machine guests. These virtualized GPIOs could be either provided

   in  (?)

> +by some simulator (eg. virtual HIL), routed to some external device or

                     (e.g.

> +routed to real GPIOs on the host (eg. virtualized embedded applications).

                                    (e.g.

> +
> +Instead of simulating some existing real GPIO chip within an VMM, this

                                                      within a
and why not just "VM"?

> +protocol provides an hardware independent interface between host and guest

                     a hardware

> +that solely relies on an active virtio connection (no matter which transport
> +actually used), no other buses or additional platform driver logic required.
> +
> +===================
> +Protocol layout
> +===================
> +
> +----------------------
> +Configuration space
> +----------------------
> +
> ++--------+----------+-------------------------------+
> +| Offset | Type     | Description                   |
> ++========+==========+===============================+
> +| 0x00   | u8       | version                       |
> ++--------+----------+-------------------------------+
> +| 0x02   | u16      | number of GPIO lines          |
> ++--------+----------+-------------------------------+
> +| 0x04   | u32      | size of gpio name block       |
> ++--------+----------+-------------------------------+
> +| 0x20   | char[32] | device name (0-terminated)    |
> ++--------+----------+-------------------------------+
> +| 0x40   | char[]   | line names block              |
> ++--------+----------+-------------------------------+
> +
> +- for version field currently only value 1 supported.
> +- the line names block holds a stream of zero-terminated strings,
> +  holding the individual line names.
> +- unspecified fields are reserved for future use and should be zero.
> +
> +------------------------
> +Virtqueues and messages:
> +------------------------
> +
> +- Queue #0: transmission from device to cpu

                                           CPU

> +- Queue #1: transmission from cpu to device

                                 CPU

> +
> +The queues transport messages of the struct virtio_gpio_msg:
> +
> +Message format:
> +---------------
> +
> ++--------+----------+---------------+
> +| Offset | Type     | Description   |
> ++========+==========+===============+
> +| 0x00   | uint16   | event type    |
> ++--------+----------+---------------+
> +| 0x02   | uint16   | line id       |
> ++--------+----------+---------------+
> +| 0x04   | uint32   | value         |
> ++--------+----------+---------------+
> +
> +Message types:
> +--------------

Do the Message types go into the "event type" field above?
Please clarify.

> +
> ++-------+----------------------------------------+-----------------------------+
> +| Code  | Symbol                                |                             |
> ++=======+========================================+=============================+
> +| 0x01  | VIRTIO_GPIO_MSG_GUEST_REQUEST          | request gpio line           |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x02  | VIRTIO_GPIO_MSG_GUEST_DIRECTION_INPUT  | set direction to input      |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x03  | VIRTIO_GPIO_MSG_GUEST_DIRECTION_OUTPUT | set direction to output     |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x04  | VIRTIO_GPIO_MSG_GUEST_GET_DIRECTION    | read current direction      |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x05  | VIRTIO_GPIO_MSG_GUEST_GET_VALUE        | read current level          |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x06  | VIRTIO_GPIO_MSG_GUEST_SET_VALUE        | set current (out) level     |
> ++-------+---------------------------------------+-----------------------------+
> +| 0x11  | VIRTIO_GPIO_MSG_HOST_LEVEL             | state changed (host->guest) |
> ++-------+----------------+-----------------------+-----------------------------+
> +
> +----------------------
> +Data flow:
> +----------------------
> +
> +- all operations, except ``VIRTIO_GPIO_MSG_HOST_LEVEL``, are guest-initiated
> +- host replies ``VIRTIO_GPIO_MSG_HOST_LEVEL`` OR'ed to the ``type`` field
> +- ``VIRTIO_GPIO_MSG_HOST_LEVEL`` is only sent asynchronically from host to guest

                                                 asynchronously

> +- in replies, a negative ``value`` field denotes an unix-style errno code

                                                    a Unix-style

> +- valid direction values are:> +  * 0 = output
> +  * 1 = input
> +- valid line state values are:
> +  * 0 = inactive
> +  * 1 = active
> +
> +VIRTIO_GPIO_MSG_GUEST_REQUEST
> +----------------------------
> +
> +- notify the host that given line# is going to be used
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: unused
> +- reply:
> +  * ``value`` field: errno code (0 = success)
> +
> +VIRTIO_GPIO_MSG_GUEST_DIRECTION_INPUT
> +------------------------------------
> +
> +- set line line direction to input
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: unused
> +- reply: value field holds errno
> +  * ``value`` field: errno code (0 = success)
> +
> +VIRTIO_GPIO_MSG_GUEST_DIRECTION_OUTPUT
> +-------------------------------------
> +
> +- set line direction to output and given line state
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: output state (0=inactive, 1=active)
> +- reply:
> +  * ``value`` field: holds errno
> +
> +VIRTIO_GPIO_MSG_GUEST_GET_DIRECTION
> +----------------------------------
> +
> +- retrieve line direction
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: unused
> +- reply:
> +  * ``value`` field: direction (0=output, 1=input) or errno code
> +
> +VIRTIO_GPIO_MSG_GUEST_GET_VALUE
> +------------------------------
> +
> +- retrieve line state value
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: unused
> +- reply:
> +  * ``value`` field: line state (0=inactive, 1=active) or errno code
> +
> +VIRTIO_GPIO_MSG_GUEST_SET_VALUE
> +------------------------------
> +
> +- set line state value (output only)
> +- request:
> +  * ``line`` field: line number
> +  * ``value`` field: line state (0=inactive, 1=active)
> +- reply:
> +  * ``value`` field: new line state or errno code
> +
> +VIRTIO_GPIO_MSG_HOST_LEVEL
> +-------------------------
> +
> +- async notification from host to gues: line state changed

                                     guest:

> +- ``line`` field: line number
> +- ``value`` field: new line state (0=inactive, 1=active)


-- 
~Randy

