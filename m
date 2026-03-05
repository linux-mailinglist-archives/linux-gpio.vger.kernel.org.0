Return-Path: <linux-gpio+bounces-32534-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GaA6NglAqWkJ3gAAu9opvQ
	(envelope-from <linux-gpio+bounces-32534-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 09:34:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D13320D7F7
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 09:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5E0B300FC6A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 08:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7D43358B8;
	Thu,  5 Mar 2026 08:34:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14182874FA
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699655; cv=none; b=Ci6zs3IBgRUq0n2oG870pkGQ375UXSX4uzbDyla7v9YhLDiAsrJKt+bUOtqD7D5MOGScRofRf42rbxRx95sSPlIGQxaRPQYD15RTH+A66xFtry9gGIV0dmtLGJKzdXmgDArScEYTuymttlpnSvf1l97N/Q97/44y9gcICLcbNFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699655; c=relaxed/simple;
	bh=hefLtFvtSppGuVWRD/xSsfWMjnGgnQggEUG9Y7OFLDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WED7Gc4CLxPC1KFYRR5mjYEXYWXUdGyUiuxYuHY/mzeMvavprA6t8of5rBymGMf6rliFp+IOqB63FwLoy1bXV9xnvhKpcghgeaH4HQQVypB+vt2BmUPO1QXeg60CiGJeKvuDj65iDPj6PBWsaQzcih3Q8sFvZsMhKGzSq0pjP78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-46391f4c1f9so4939324b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 00:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699653; x=1773304453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=bHf9HsyB95+ulACBeUgzW2IJkgf/Vh0Q/Oskm2CwFAQDchXcBEgK4Klm+N8Jer8cMr
         faKNjWxLET5g5yvhvLzDnWF6x3RmUuW7N02VK6KECcOCF+sF8TZw7C2Rp+aPpVB2U7Rw
         YPFGUsUQxoEtIXZEFKLUMjzRSEe3PwOYe2MqQPNYGIi0hVq8O/0Oo0PVz6HhltrajMY6
         tybzJUlSdZn7X0ASHfNMUudIxkF+Uyq4HSmGNQrxxeY0ylxtJBavn9DRuv1sVQdKZlku
         Oa+vCYb0ax1lp1glcxWPHqnJG168RzF4regHBrOBLei78BZ72OZHFh0nOpe7oe1CmY/K
         +bHg==
X-Forwarded-Encrypted: i=1; AJvYcCX2MqgQ9uN9xNaG9Ac7FQXj3Sn9QNwN/yQ9zIm6OxWpvkkN7RpOQXeLHwulwTsRTdtudYjJXYYj0h+s@vger.kernel.org
X-Gm-Message-State: AOJu0YxOlzSE3JBBSODoTri71j+EnDbelf7RlcrEAT6hxopvD8VOVnU5
	cSuHXWCwqxSadDnOxPns+CpD4TrgpXAIRpnVBzUSn1uJJUZOyCNclS0RTzlbWvRd
X-Gm-Gg: ATEYQzzIK2oeqiEUpDUxB7w1p12QMukAuxtCU3X/kVmYcMieXJ050b45k3xj++pt+vK
	xv0dR1p4N0kE0RDsotVM/ngOkUPne2Aq+sXHFhJLu6zK2N1zEHaMXpFeE2jWudMpkyPMYBesvbd
	Wioc0HkL8QL4FOE5E/kbriN6NZLMSVPWaZuVrEPMKyEYd+KJeSJChhvCh9ldtgxVPfkV8jo43BI
	T7RpoPxSI5PpBjH45RovceFFVDQ/H3G9wvdQUX1kwHvVKd8wIfjRqZ7HVlJIzFQh5QXSLFMyrPu
	qMQYBZM/6BSz+F5xK19sGpsh2fQ9UTK+LI7eAunhktRWq+7LaQ6p8UfurtpO1g9I0poohwhjs/K
	2Ptc3yyJoSBiZcj6ACEpjE2SAul7SezFyMCgzi3VKN0spbk9cR8F3gObAr5s+jEUJyY7lRf/WmR
	HSWNqWxfVJJlzME9d/FEV07xlWnFQdNjy+ox23gGSdHD5UUpFLRfXSDP8r6p/Q8Drw
X-Received: by 2002:a05:6808:1488:b0:45e:b623:f9b3 with SMTP id 5614622812f47-4651acd8a43mr2495386b6e.42.1772699652667;
        Thu, 05 Mar 2026 00:34:12 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d26d45fsm20534596fac.14.2026.03.05.00.34.11
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:34:12 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-46391f4c1f9so4939317b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 00:34:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdrxu4F1lRdPTON9QH70b0CiantUfODVDHw+6whuTQra0pzV0N05EpZuOP+WSH5hsOEJDGl8K96Zw6@vger.kernel.org
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2D13320D7F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32534-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,nxp.com:email,ti.com:url,ti.com:email]
X-Rspamd-Action: no action

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

