Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDDB38749D
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 11:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347702AbhERJHF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 05:07:05 -0400
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:45851 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347059AbhERJHE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 May 2021 05:07:04 -0400
Received: from oxapps-11-062.iol.local ([10.101.8.72])
        by smtp-32.iol.local with ESMTPA
        id ivXflS2QoBc6YivXflyVc1; Tue, 18 May 2021 10:57:31 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621328251; bh=NVnw5g+VXhVolsNBA9uOez+5YRjViDjU8xB516saj4c=;
        h=From;
        b=KV2KAo9X6fPXwYtzH3q+0GN7GvtyTZlWnripOO/8qsxlHQDhU3GJuxpxND0ojAX7G
         lWvRNSoAxsWi8o3KN0uXmHrjexb7lRQGCF+0dFsNUjH1FvQjcQfdu0oAX+J+KAinpp
         6DcL+o7shC0KSna31mxXfVqm2qAFtQYeQgiSCFePD1BYQDECvQvHMDg0wSDH5WxQCX
         iRFiUwImB6H1uJUxluBXg+sGiobMOdfaNl1GoPb3rCy0+7Rk8tiSZqY9fSRuV1DlYD
         TSNbIwdFV52wCerr0D8OZT6/UEM8SzYHTZopH48AwQ81ny9PZm32oxEXSOU3UXAgSx
         YQ5FR+DRZQ86w==
X-CNFS-Analysis: v=2.4 cv=B6l8bMhM c=1 sm=1 tr=0 ts=60a3817b cx=a_exe
 a=ArCppHiS2LX9rvfu7+HyXQ==:117 a=C-c6dMTymFoA:10 a=IkcTkHD0fZMA:10
 a=vesc6bHxzc4A:10 a=2KMo9-giAAAA:8 a=D_9wInirL2l4cj3dWgsA:9 a=QEXdDO2ut3YA:10
 a=UeCTMeHK7YUBiLmz_SX7:22
Date:   Tue, 18 May 2021 10:57:31 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Message-ID: <1340368809.152927.1621328251188@mail1.libero.it>
In-Reply-To: <YKNZIzyO5Q/XGLRs@atomide.com>
References: <20210517200002.6316-1-dariobin@libero.it>
 <20210517200002.6316-3-dariobin@libero.it> <YKNZIzyO5Q/XGLRs@atomide.com>
Subject: Re: [PATCH v2 2/2] pinctrl: single: set pinmux from pins debug file
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 185.33.57.41
X-Originating-Client: open-xchange-appsuite
x-libjamsun: B0TjijWmrbfJWP3WAkKFWo1lCjhGy9T6
x-libjamv: ghWYi9jvb6w=
X-CMAE-Envelope: MS4xfCr5xJ5H3yfOGVmZvzF4wcZgFaf0rRSXvIEcInlgH1v5EZ/YwGVek1PyBI+EJJvi7FRHYPUjrF/2YiYR2VT7/91Fg7GaZuHmZYk6kh8kS7A4hBeOREmu
 0flGY6ZewK/uspSQ0HLHmyr2/6a+q4L3vhIkXqXEasYtNwx20D+Kdsel1635GBLQoG1GDB6FQdz5bGgFHM3dJA7ZEKS8uLBoKzrdoTNSbopQ1irMLEgUp6/V
 y+eW+mIQ86THswG+MKbNcQRBB1Chdu+CEEJ0WOG9vVddkLd46N/yKcAKiTSlM8l+DJnsyvDWwzBOxcxqMy4Zu3Uj+WQzN9elFOhzbk7UwF57GQ9HD4HwxPDL
 Xni1zqz9pznlUCr/woNVIHlJQ2uJFwxGgseyJ0vKV+Ma7LEbe8R53Vfi+cdSOMZUp4JRvZqqMknbgQYShnEVQGP1A0C1yA==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Tony,

> Il 18/05/2021 08:05 Tony Lindgren <tony@atomide.com> ha scritto:
> 
>  
> Hi,
> 
> I noticed few more things I started to wonder about after
> looking at this again.
> 
> * Dario Binacchi <dariobin@libero.it> [210517 20:00]:
> > +static int pcs_pin_dbg_set(struct pinctrl_dev *pctldev, unsigned int pin,
> > +			   char *buf)
> > +{
> > +	struct pcs_device *pcs;
> > +	unsigned int val, mux_bytes;
> > +
> > +	buf = skip_spaces(buf);
> > +	if (kstrtouint(buf, 0, &val))
> > +		return -EINVAL;
> > +
> > +	pcs = pinctrl_dev_get_drvdata(pctldev);
> > +
> > +	mux_bytes = pcs->width / BITS_PER_BYTE;
> > +	pcs->write(val, pcs->base + pin * mux_bytes);
> > +	return 0;
> > +}
> 
> Since you're adding a new interface, how about pass unsigned
> int val instead of char *buf?

I thought about passing char *buf because it seemed more generic 
to me. As the output of pin_dbg_show() depends on the platform 
driver, perhaps pin_dbg_set() may need driver-dependent data.
Is it possible that only the value to be set in the register 
(unsigned int) is required?

> 
> >  static void pcs_dt_free_map(struct pinctrl_dev *pctldev,
> >  				struct pinctrl_map *map, unsigned num_maps)
> >  {
> > @@ -331,6 +348,9 @@ static const struct pinctrl_ops pcs_pinctrl_ops = {
> >  	.get_group_name = pinctrl_generic_get_group_name,
> >  	.get_group_pins = pinctrl_generic_get_group_pins,
> >  	.pin_dbg_show = pcs_pin_dbg_show,
> > +#if IS_ENABLED(CONFIG_DEVMEM)
> > +	.pin_dbg_set = pcs_pin_dbg_set,
> > +#endif
> >  	.dt_node_to_map = pcs_dt_node_to_map,
> >  	.dt_free_map = pcs_dt_free_map,
> >  };
> 
> It might be better to always have the .pin_dbg_set around to
> avoid the IS_ENABLED(CONFIG_DEVMEM).

Ok, I'll remove the CONFIG_DEVMEM dependency

> 
> Does the new interface need something under Documentation too?

Yes, the description of `pins` in Documentation/driver-api/pin-control.rst 
needs to be updated. I'll add another patch to the series.

Thanks and regards,
Dario

> 
> Regards,
> 
> Tony
