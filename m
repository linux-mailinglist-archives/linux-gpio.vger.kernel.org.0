Return-Path: <linux-gpio+bounces-34973-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBMsFTEP2Gn3WwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34973-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 22:42:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B01043CF92A
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 22:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE35C3012C5D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 20:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EC9331211;
	Thu,  9 Apr 2026 20:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="AEPaUGPg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E366428727D;
	Thu,  9 Apr 2026 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767341; cv=none; b=Ei4yBe69pbesAI0GXBJO3pIuFa7A8L212rjlhWu/L3aA4zZjT7Q677kbz5JMy3VTXlcVM5/9SubeS+umfFK2OprgG0IkHjX0Ng2Q9cmlY6v1ZYNvKpuRm+2s60D4hCux5AwfcVFwVtFtqnxP4ptEvC96DRq/4q2WSx088qq72Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767341; c=relaxed/simple;
	bh=XmotdEgM3fx1B4cVNEkffKRihdxQ9iO+c3wPvCjSOVo=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=H9vIrne0GrYynUlV0OYk5Dr96gbE1pogAlqgWLP6C4nsz4tv5E0jbFyLSJyyr4YzhbDTT2YhNpMHXzbowZlG6oQgS7VHRi249pTs4ViEexwVB8eTyXRUUZi6UphlN8zXqQ+hJua2fsPzJkORnfz1bI11qd29+/cOasp3ekiewO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=AEPaUGPg; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1775767330; x=1776372130; i=frank-w@public-files.de;
	bh=5QlvSQ0HNSqS+Dhun8NXAoIfOSdeQi4kARON5BDNe1Q=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AEPaUGPgIwzym5EjKp1Rh7/BsbYxv+FEDJf7v+Yie7KAqeqOxHbHR3taJxhY26Zl
	 nKAezOt434pwLCNz/5K/KB0Xsv7YMhCHjpSwpeYT35qbMsUWVToti8rW32PsWX7YI
	 dRKReAs0f5hy0ZmMYFrTDv+6H1pTyKk3cujmuc8lFss6kwnHkFDsZzeTs5VPV0+DS
	 BJ4RUvbrVB+rVaTd0zDbNr9/02Z7gKVyJ1R44H9B4aR5zQy3TSg3lfnbHwI1zmJtZ
	 vu3lqtpMZ2TeptFlfkG3vocF9sYkLcL5GyJcge0TjdOeah61I5dWBB9Glh5ZAwXg0
	 tsMlh25Go18rSZkEag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [194.15.81.119] ([194.15.81.119]) by
 trinity-msg-rest-gmx-gmx-live-5cf7d7879b-89lbz (via HTTP); Thu, 9 Apr 2026
 20:42:10 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-93899756-f769-4496-9acf-268f65f0d612-1775767330691@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-89lbz>
From: Frank Wunderlich <frank-w@public-files.de>
To: brgl@kernel.org, linux@fw-web.de
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 daniel@makrotopia.org, linusw@kernel.org, brgl@kernel.org
Subject: Aw: Re: [PATCH v1] gpiolib: fix trace on missing
 gpiochip->get_direction callback
Content-Type: text/plain; charset=UTF-8
Importance: normal
Date: Thu, 9 Apr 2026 20:42:10 +0000
Sensitivity: Normal
In-Reply-To: <CAMRc=Mdh=P8ABX2kO-j9hp0oy=1-9rJZUYwZR4APNz1qK9FVcQ@mail.gmail.com>
References: <20260409132724.126258-1-linux@fw-web.de>
 <CAMRc=Mdh=P8ABX2kO-j9hp0oy=1-9rJZUYwZR4APNz1qK9FVcQ@mail.gmail.com>
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:0791cDOrPfiyFfRMxPtF575/UfjdRK5Effqmu3a3x/DLajiJFIQBKGT3DdkaTbuguB5RT
 cJBKJu6WZShhQ3eBK/WQgoruXWlzcKE+Xk3yEfbBUp5YNBY5SNW6PAR+v+oQAJ+3Jdbm7Td3B1nd
 XSU7zgQ55kmTmvSyYcG5k9Mq5K9MHOe/eHqRU3oPK4hfEbe0tsPS+NKrl1OS5KpMNPJlXLg6crgb
 IR7SUdeRYg+qpo6TbZxhCMtLpqVZODj5znhYIPmf9eFG3Kn5dMSGJ7AH0kyEbdp3WqPjZb6KZ4nA
 fHhy1a/eJHuDTictXNv85hMXHa6/bcRacUC0jFPLC3yVtNClbwLSWpy4PH2AT19vF4=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:J4028As/mj8=;c9udAGiRzW1v/GCWoMTFG2+rf41
 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
 B/F6g==
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[public-files.de,quarantine];
	R_DKIM_ALLOW(-0.20)[public-files.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34973-lists,linux-gpio=lfdr.de];
	HAS_X_PRIO_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[public-files.de:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[public-files.de];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frank-w@public-files.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bpi-r4:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,public-files.de:dkim]
X-Rspamd-Queue-Id: B01043CF92A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

> Gesendet: Donnerstag, 9. April 2026 um 16:23
> Von: "Bartosz Golaszewski" <brgl@kernel.org>
>=20
> I prefer GPIO drivers to just implement get_direction(). Looking at the =
code
> it should be pretty straightforward for this driver.
>=20
> Can you test if the following works for you?
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c
> b/drivers/pinctrl/mediatek/pinctrl-moore.c
> index 70f608347a5f6..071ba849e5322 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -520,6 +520,23 @@ static int mtk_gpio_direction_output(struct
> gpio_chip *chip, unsigned int gpio,
>  	return pinctrl_gpio_direction_output(chip, gpio);
>  }
>=20
> +static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int =
offset)
> +{
> +	struct mtk_pinctrl *hw =3D gpiochip_get_data(chip);
> +	const struct mtk_pin_desc *desc;
> +	int ret, dir;
> +
> +	desc =3D (const struct mtk_pin_desc *)&amp;hw->soc->pins[offset];
> +	if (!desc->name)
> +		return -ENOTSUPP;
> +
> +	ret =3D mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &amp;dir);
> +	if (ret)
> +		return ret;
> +
> +	return dir ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> +}
> +
>  static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct mtk_pinctrl *hw =3D gpiochip_get_data(chip);
> @@ -566,6 +583,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw=
)
>  	chip->parent		=3D hw->dev;
>  	chip->request		=3D gpiochip_generic_request;
>  	chip->free		=3D gpiochip_generic_free;
> +	chip->get_direction	=3D mtk_gpio_get_direction;
>  	chip->direction_input	=3D pinctrl_gpio_direction_input;
>  	chip->direction_output	=3D mtk_gpio_direction_output;
>  	chip->get		=3D mtk_gpio_get;

it looks good on a quick test, just reverted my patch and applied yours an=
d got no trace=20

root@bpi-r4:~# cat /sys/kernel/debug/gpio=20
gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
 gpio-0   (                    |tx-disable          ) in  lo=20
 gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE LO=
W
 gpio-2   (                    |los                 ) in  hi IRQ=20
 gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE LO=
W
 gpio-13  (                    |reset               ) in  hi IRQ ACTIVE LO=
W
 gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE LO=
W
 gpio-21  (                    |tx-disable          ) out hi=20
 gpio-69  (                    |mod-def0            ) in  lo IRQ ACTIVE LO=
W
 gpio-70  (                    |los                 ) in  hi IRQ=20

gpiochip1: 16 GPIOs, parent: i2c/3-0020, 3-0020, can sleep:
 gpio-14  (                    |blue:activity       ) out lo=20
 gpio-15  (                    |red:fault           ) out lo=20

output seems correct.

regards Frank

> Thanks,
> Bart

