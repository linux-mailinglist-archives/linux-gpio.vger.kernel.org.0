Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0619228E430
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 18:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgJNQRe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 12:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbgJNQRd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 12:17:33 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5EFC061755;
        Wed, 14 Oct 2020 09:17:33 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id b19so2052806pld.0;
        Wed, 14 Oct 2020 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vEOij1W5YzKHI9vk48WeDQVrXJh9T0sK+XbA6XZMKSY=;
        b=V8FEUSywm+8lN/iBx6wzgrSVeDnO22RAo8NMA/LIk9ckj2VqxilRpFWD0ZWZoqW0Q4
         Fh4+/Npo/GV8ah3JfWrvJhufLS/B4VATgFs+01LtSiY1BXEfWcEOBOR5W5jT+npooZ1Y
         hOB3VmRYmR+u2C7DEUrFIl/kPSx81C7yKeGlTw3xpU3/cw9VVDsZkYuaxwP5ORGqp0bs
         DBq4YisUym3L0GsKvExKr67r9fPbWK68QXATAhZRGIRvOe2gOWrFdGBBCE5ZFsHwYtDh
         mmJTFWMt5Dru016UacBffHAd5C/ZGC2VAK8/Ckfx6Anzb+bmd7OKhJfdCosBfcIjXrx3
         RXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vEOij1W5YzKHI9vk48WeDQVrXJh9T0sK+XbA6XZMKSY=;
        b=fZGUtsovihw6qQmfP4SEyJaYthCmpgyj/tjPoe5dad3vEhpAUAq8qmbaopfG2Aej2G
         5SDLpW/FDlFg8ZZOlq2CJJZuufLfAVPmgx2STe/brh2G/PD70Tb9MyygnXxiLel1X3b1
         Z80kvM6F3RImOEGsmj9IUQhttPrHJXYn5fW6htJNwqKqWtT4hthS9wCq464Ho3JKomxn
         zd6R/Cd9I+S9pK3IWhnjopKabBqLaccCPl8GS8RT8AcyZEr7/RTJnVNYEIoh6jpjp/ak
         1zuN2D73m6Ort8V+8LqWFXEx7vYICZ+QG4gClVsAXlcfBo8vuhCd51XdvxEM8Fnp79PD
         Stnw==
X-Gm-Message-State: AOAM530WpTdnwH8UhWQAp5vGxGY6Pmp+/z78DeuEQyucBLRo7Rbg8Dg3
        zSxhfLSeyqSP7RgW8J1SuBQN+k4Pm4Qegg==
X-Google-Smtp-Source: ABdhPJxEXco0p9UWpFVwL3CS/WMdRWMjfNJI/y28E0rZMiRhZQeVlW0/oBaRUpPT9fvndjUlCurDNg==
X-Received: by 2002:a17:90a:ff12:: with SMTP id ce18mr141996pjb.223.1602692252826;
        Wed, 14 Oct 2020 09:17:32 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id f9sm101164pjq.26.2020.10.14.09.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 09:17:31 -0700 (PDT)
Date:   Thu, 15 Oct 2020 00:17:27 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Jack Winch <sunt.un.morcov@gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: cdev: allow edge event timestamps to be
 configured as REALTIME
Message-ID: <20201014161727.GA663047@sol>
References: <20201014062740.78977-1-warthog618@gmail.com>
 <20201014062740.78977-2-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014062740.78977-2-warthog618@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 02:27:38PM +0800, Kent Gibson wrote:
> Using CLOCK_REALTIME as the source for event timestamps is crucial for
> some specific applications, particularly those requiring timetamps
> relative to a PTP clock, so provide an option to switch the event
> timestamp source from the default CLOCK_MONOTONIC to CLOCK_REALTIME.
> 
[snip]
>  
>  static void linereq_put_event(struct linereq *lr,
> @@ -535,6 +536,14 @@ static void linereq_put_event(struct linereq *lr,
>  		pr_debug_ratelimited("event FIFO is full - event dropped\n");
>  }
>  
> +static unsigned long line_event_timestamp(struct line *line)
> +{
> +	if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
> +		return ktime_get_real_ns();
> +
> +	return ktime_get_ns();
> +
> +}

One minor hitch - that should be returning u64, not unsigned long,
or the time gets reduced to 32bit on 32bit platforms.

It's getting late though, so I'll send out an update tomorrow.

Cheers,
Kent.

