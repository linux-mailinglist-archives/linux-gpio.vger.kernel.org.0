Return-Path: <linux-gpio+bounces-32532-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KrDFjQ1qWlH3AAAu9opvQ
	(envelope-from <linux-gpio+bounces-32532-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 08:48:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C9720CE1A
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 08:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 222273030B20
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 07:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EB63264F2;
	Thu,  5 Mar 2026 07:48:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576EE3242B1
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696880; cv=none; b=Cc4rysMVJzgBW9Z5dSUPWWcMw7mlo93v4hWGOqPQ9tOSQqb6i8RuK/EN8bBIQt1irjb6Fi7SLZIryC3OBYBHVGFGTsmMF/hwPn2gJLSdEC8nPg/N66qT9hDhApLWRXNB9Zfj7a1a5QWrP04dBdztmCMEnKpc9/9UuHF8JPeto3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696880; c=relaxed/simple;
	bh=urVD1xPdaF3hV5GqXqVqTidMinFWi7P2lc2J0G3o7gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fyo+iCjO71lyXJz5/ZOEQy0bA0J1XV+9U+cQL59PycHQ/8uA1kVSGkbT6sH+3IXGubYpJNyPN/VVBV5lwQnbTQuXiYgF1V8o2QcvXbCpCX39m8l/6xZUsk4f81a6wEQNsD3lnds2PCFtRB3bGkkwLcHDSqGDrlY7CNT64C85qwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffa0b23a60so858009137.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 23:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772696878; x=1773301678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
        b=V4nVGE/L+zFePRitZ4IQ7mIhQqSuHIojsnEAh+f3cC87E8PunDxpBjT83t6b62OnUa
         tMc27xo7yarhKsWDB1WBFFuU4pwj7WlHNxv05+PAAuii/JiVRmO6eJ8VUjnPM8KIBHJy
         589iQWtcl5nR5jkbqLHQAlB1atX0QfLg+mxg9kfMB0k/ofUmW9M+BhgvqfYlJ8MWf9Od
         NG9Y/6XQf869m1ODmUzGafwhhUokVDsYjackyroz9AqMi1WlpMXR7AEIxZVkBJDwBlix
         mZUpphWcocwk3rvsp58SIQo/qHIiYgpYCMhwZJprhwsPUNihyba2Z5qVf7WP5LaVrHd3
         AWNA==
X-Forwarded-Encrypted: i=1; AJvYcCWAUh4suDiFJ7qfss6Aeo+UKaOd8fiZHhISIbykRHyWLi8JWcuZW0NM5BcOTLlE7Nb7buUavthIdcND@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrf2Ao5LiCTo/oNmSIGYN4MhJFXM5O/GJ+3xU5soELGWtd+eo5
	3mEAOnyC0jbqUzWW8QrQ900wBnGtkz572BReNbj9Mdjb6AY2co1aum2LqLBBma/u
X-Gm-Gg: ATEYQzyel6JJrIh3d6tuZ/+waz1+7e5CUE0yEs1os/dO1wCShBIuBmsRNsfCJpup0F6
	p6GIf+x02ioWhruEObYvWZBwCF3+TSd34rzivW8k2MswFwRwrhp1NfsQyw5yhY7Guum1PtW6SF8
	B0FpMTvlnxFOJiKz8l84YTbZ9ozEppz++x2u2mVFNAuPomvhB37z4tMQVEvKM3geOfHndmLSYRO
	0YOwiE/dJOOSAZVGtckkTRXXCsR8XtWT4YWF+HA0A98orKXaAd60Irj/9rPFMb3RxXa/2OU3J+q
	B07hkSEA7dnC401ANfis1zZwGZ+DuL8eW6EKBu0FWR6r1Xf4l9IG3TXMctXIq2A9BZ5PMFx4Wud
	4dIejb0730/ad29opJ+Pg+LzMOnSqqydZRP4vxzd7ybmrk3LqslzT1ENqJW631dMzqSRdnvCEVo
	mdSaFMbtpLeYNRR+KSsvzgOClOI/6JP7kJXoy223GAOuhwK7EG8gfy04uL6ExK
X-Received: by 2002:a05:6102:26c9:b0:5f5:773f:b1e3 with SMTP id ada2fe7eead31-5ffaab12b9bmr1937946137.11.1772696878352;
        Wed, 04 Mar 2026 23:47:58 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffaa208aeesm4681556137.12.2026.03.04.23.47.58
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:47:58 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ff18242343so2069554137.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 23:47:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMQJ3HtFT3rTTOIO4kh6rDPnppKiAK349U9q9hNa+u1Ephxljzg6rqXSWWrd0BiSNpXbydmfhPfHDa@vger.kernel.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
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
	UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 98C9720CE1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,baylibre.com];
	TAGGED_FROM(0.00)[bounces-32532-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.970];
	TAGGED_RCPT(0.00)[linux-gpio];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email,nxp.com:email]
X-Rspamd-Action: no action

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

