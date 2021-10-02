Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F24641F8AA
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Oct 2021 02:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhJBAU1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 20:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhJBAU1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 20:20:27 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22C4C061775;
        Fri,  1 Oct 2021 17:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=RqX8/wclMPh8rdKmPHIqwNBBYNDwMU8vPuFzjp1ZKig=; b=RVvzTboaKRM1qFIDREl9FccXN8
        U9jmnJ4h6Zg6gnVkYw1Aui63VaCOXtf/4dd3UAAvWDMjQMDQG5aCKykfzsV0/lpmpr1x4pc8Q0Ekx
        CJ33ImURpLylkWsOdwvDfIZjCOjuzARAX1eEwIIdGRWWs7VOy9DqAwKYid6ND8BROeNljGLRG+x7U
        eFNSchp2R2gNMRoBA5oNhyaXwDch6/FvC3EmDEoYII0emZ8JKw/G/4epmUfPsO6n2KUQJh8n2IECl
        A3u50OmYNI8z7U/8Ji9NjcfRgFKby4m5FArnDrJIITZtKtv6yQbI0JQj/t+TQjaXsCBZO87gaYiJz
        E0Tz9EvA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mWSji-001XMM-2a; Sat, 02 Oct 2021 00:18:42 +0000
Subject: Re: [RFC v2 01/11] Documentation: Add HTE subsystem guide
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-2-dipenp@nvidia.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <70321686-276c-b972-302a-e649f28412de@infradead.org>
Date:   Fri, 1 Oct 2021 17:18:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930232617.6396-2-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/30/21 4:26 PM, Dipen Patel wrote:
> Adding hte document which can help understand various APIs implemented
> in HTE framework for the HTE producers and the consumers.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
> Changes in v2:
> - Removed explanation, instead added kernel-doc references.
> 
>   Documentation/hte/hte.rst | 83 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
>   create mode 100644 Documentation/hte/hte.rst
> 
> diff --git a/Documentation/hte/hte.rst b/Documentation/hte/hte.rst
> new file mode 100644
> index 000000000000..c9b1badae601
> --- /dev/null
> +++ b/Documentation/hte/hte.rst
> @@ -0,0 +1,83 @@
> +============================================
> +The Linux Hardware Timestamping Engine (HTE)
> +============================================
> +
> +:Author: Dipen Patel
> +
> +Introduction
> +------------
> +
> +Certain devices have built in hardware timestamping engines which can
> +monitor sets of system signals, lines, buses etc... in realtime for state
> +change; upon detecting the change they can automatically store the timestamp at
> +the moment of occurrence. Such functionality may help achieve better accuracy
> +in obtaining timestamp than using software counterparts i.e. ktime and friends.

                 timestamps

> +
> +This document describes the API that can be used by hardware timestamping
> +engine provider and consumer drivers that want to use the hardware timestamping
> +engine (HTE) framework. Both consumers and providers must
> +#include <linux/hte.h>.
> +
> +The HTE framework APIs for the providers
> +----------------------------------------
> +
> +.. kernel-doc:: drivers/hte/hte.c
> +   :functions: devm_hte_register_chip hte_push_ts_ns
> +
> +The HTE framework APIs for the consumers
> +----------------------------------------
> +
> +.. kernel-doc:: drivers/hte/hte.c
> +   :functions: devm_of_hte_request_ts hte_req_ts_by_hte_name hte_release_ts hte_enable_ts hte_disable_ts hte_get_clk_src_info
> +
> +The HTE framework public structures
> +-----------------------------------
> +.. kernel-doc:: include/linux/hte.h
> +
> +
> +More on the HTE timestamp data
> +------------------------------
> +The struct hte_ts_data is used to pass timestamp details between the consumers
> +and the providers. It expresses timestamp data in nano second in u64 data

                                                      nanosesconds
                                              possibly:           in a __u64 data

> +type. For now all the HTE APIs using struct hte_ts_data requires tsc to be in

                                                            require tsc to be in

> +nano seconds. An example of the typical hte_ts_data data life cycle, for the

    nanoseconds.

> +GPIO line is as follows::
> +
> + - Monitors GPIO line change.
> + - Detects the state change on GPIO line.
> + - Converts timestamps in nano seconds and stores it in tsc.

                              nanoseconds

> + - Stores GPIO direction in dir variable if the provider has that hardware
> + capability.
> + - Pushes this hte_ts_data object to HTE subsystem.
> + - HTE subsystem increments seq counter and invokes consumer provided callback.
> + Based on callback return value, the HTE starts kernel thread and invokes

                                             starts a kernel thread

> + secondary callback in the thread context.
> +
> +HTE subsystem debugfs attributes
> +--------------------------------
> +HTE subsystem creates debugfs attributes at ``/sys/kernel/debug/hte/``.
> +It also creates line/signal related debugfs attributes at

                         signal-related

> +``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
> +
> +`ts_requested`
> +		The total number of entities requested from the given provider,
> +		where entity is the provider specific and could represent

		             is specified by the provider and could
(just guessing here; I could not parse it.)

> +		lines, GPIO, chip signals, buses etc...
> +                The attribute will be availble at

		                         available

> +		``/sys/kernel/debug/hte/<provider>/``.
> +
> +		Read only value

		Read-only value

> +
> +`total_ts`
> +		The total number of entities supported by the provider.
> +                The attribute will be availble at

		                         available

> +		``/sys/kernel/debug/hte/<provider>/``.
> +
> +		Read only value

		Read-only value

> +
> +`dropped_timestamps`
> +		The dropped timestamps for a given line.
> +                The attribute will be availble at

		                         available

> +		``/sys/kernel/debug/hte/<provider>/<label or line id>/``.
> +
> +		Read only value

		Read-only value
> 


-- 
~Randy
