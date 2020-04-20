Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6F11B061E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2020 12:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgDTKBN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Apr 2020 06:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTKBL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Apr 2020 06:01:11 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E619BC061A0C
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2020 03:01:09 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id r17so7403239lff.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2020 03:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wyFtSNJl2G03Tcx5KpwAduEnoNtEjy/Hx0hGrONxTd4=;
        b=qzICVCwOXmgrIa5f0Lw9hrAGj2QiM0GGS7tGGkhFl7IVzuMoyI4d6R8ynOpm3FUXy5
         QX18VEEQzkaZ7WPUbEnhObyQDdXIafmX50ZUWCTuXre9aIwAHVMIm9J/C/sxEQ0vmlcn
         6HrxOyhN6TNwnXeBPOvwjcHf/yEdQdZsfImyN869y/VcREfzwUd4hZwXrH6aH4qJPr36
         NIWTF+fuQlryqSzMN3mLFxFMToNAfEdF0aZf52sSIhIkI3UiQb1f7hpzb9fie+UDfcTF
         1Hx8YQ4F+513QcbMq3R4XK3Zd/XEG8J+yzAHDtRbR0q52uY0a4HysvJT41cIUhD+zVyr
         O+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wyFtSNJl2G03Tcx5KpwAduEnoNtEjy/Hx0hGrONxTd4=;
        b=SmS2TEq5kI4RBWF/H6i+D6tAlVZbK/9RJpFsnXl2RrOyM+u5y0lzPc067yqYHdS5lV
         K1H2yFFU90pcmSeiew7YLV8lADuq/C4NU5+1hY2sc/FKnnyuZSWF/mHfEUJsFPf17vFH
         rkDUDY46J3wd6i+ETCdVZjEnC1LnbJyRfqoE6AlJdkPStglWyTgnJ9xTVl/igBLSUj70
         z6y/rOEdqWYynUe2Uw1xRWBvvesjOjXOE6aH+IzkfjLzfWkdQIYbYcFzEnK1umWnIfU6
         MxDW7R4wGLLxrT3GWlNzghQWyX6A9C8zcScu543oy9bk+YpIJUJxDAWIl0mAUhzwSFXZ
         YEvw==
X-Gm-Message-State: AGi0PuajkibS91EWKDYL5njWgS1vjOtDy5WvseOKxm5Yy4PRvk3hbttI
        CpsWIXPL+DCjzy/gF287GuFcQg==
X-Google-Smtp-Source: APiQypJnnbmYiOWPhcsCZrmK0qY08f3WC3u36TdgXOaACsQH5v7PKrHXp5qAaNKMKOmdEVS2hn/8SQ==
X-Received: by 2002:a19:c64b:: with SMTP id w72mr9838231lff.82.1587376868385;
        Mon, 20 Apr 2020 03:01:08 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id v15sm584483ljd.33.2020.04.20.03.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 03:01:07 -0700 (PDT)
Date:   Mon, 20 Apr 2020 12:01:07 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add DT Bindings for Renesas Pin Function
 Controllers
Message-ID: <20200420100107.GA1786619@oden.dyn.berto.se>
References: <20200417141003.22816-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200417141003.22816-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-04-17 16:10:03 +0200, Geert Uytterhoeven wrote:
> The "PIN CONTROLLER - RENESAS" section lacks the related DT bindings.
> Add them.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in sh-pfc for v5.8.
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cbcd80a89eadb4..b5edcd4bdbdf63d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13378,6 +13378,7 @@ M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
> +F:	Documentation/devicetree/bindings/pinctrl/renesas,*
>  F:	drivers/pinctrl/pinctrl-rz*
>  F:	drivers/pinctrl/sh-pfc/
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
