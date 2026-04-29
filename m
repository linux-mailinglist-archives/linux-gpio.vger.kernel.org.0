Return-Path: <linux-gpio+bounces-35784-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE2QJSfK8Wn+kQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35784-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 11:06:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CC24918DA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 11:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFAD6309BFD5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 09:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA6D3BBA04;
	Wed, 29 Apr 2026 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RMpU0uSS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E523BADA3
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 09:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453453; cv=pass; b=H2gYMmgzngWq0JVdY/95Jzivry5Q8SYv3Mu/L5iuLvfxyh1QuSBkNDR24CSNxVALkthqxxJaH/w1Y6ienM0bYqjU6Ie4dosIQiPywlGLod6bFbeJT02u/ZwZnmPKoUKL2a/69r9kw+O7DT2rESR46QrH1GcIm2VHYFMybyYrkAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453453; c=relaxed/simple;
	bh=WxWN6XSyo/+1hHu1XworaYqGk/rsJXleaxoC6q5ANPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4lixMhr25CQ8k9V1BbJBi7pGECG0Ayq4EpH4ALnVLWjXqKLhQHHdeAAThIFJsm5OjRvW9YJhPMrBKYLtgQu7d29yrzmTc70bImgNcBUYg/0rcOJw4JnMK2ImeCebV06l1h4zTBRpp7GX2Cv2JHUekyE5G/SH8l5KDWFLPcLICc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RMpU0uSS; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so12583192e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 02:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777453450; cv=none;
        d=google.com; s=arc-20240605;
        b=J/L/wuRJuCIoWafUKWqtD6fFPFZUX5FKSKE9COluId6gK203JD3PSli8B5TOup9amf
         Npo5Ay/L3Lfg/NvOVne39owZwuLstJEd0S+lrKcgvFEMIaZkgJ8RiXbdJzm0xjlSEuko
         MJJqaamn0xvQNsd7r4qrmaB5rXvr40gQSzqUzW1p6z76Gcpgu3NspLlS9OZiSIK2XVQX
         nqmzFsHGS3EstC+py8d+jkJHJskTmm5G09uVI7y40YeHn5PxfxySupJc6r0ITn6BC2dC
         mUD+78MGyn07SBpEDtHiXSNrj5xoOw4w6cWkdlQG0I61sFRlEVy/SQdRUIIEtgp/QoVy
         h0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=;
        fh=vvC4MeZdwCb0iGr18rm7w4qJPoG8AC10v/bJwC6UAe4=;
        b=YS7gyMXC1L6VeTa9HSQD2zMAvdO1txVR9d8GazkN0MMqJap4sfQS1wGe2zGlJOJGas
         Rm3usoPTOabvBlDYgnsqzT7ClUUSUCFs2zHByrKq+1GwlGZ95rmMg0rFe7OwZWX9P0Gh
         ePsXL46apBEkne8SkDskiNZ0wqcGhe06RYkT0928JKV2ZHG6tlvEGpQWipW6IbbeLJMh
         Aemt+7O8/OLnr+GJxdvUihXFQUSivIYyFsq0r5hvSzuxq72BpDZB+NiAvjePhbtMRKaU
         6hvk36mpiHjdGoNEwNRYfe3s0NbYOkyY29ITZXgORQ5dnyLdCFBLuuOAwMQa6zJRJXAs
         GWAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777453450; x=1778058250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=;
        b=RMpU0uSSjYMoGCcN5UfvA88WUSJCeXaoSLrHoZzscF8sY739HWW9p/YbJeUgm3n5ZJ
         M9csKcON6/9XVNGLEJmUWi8NJOfCHU6yrMjiBb0myINwYz2Y/0qkDRi59habQXmKOFaR
         oPa2Zt32epFHPfJq8SwEH+wArac8MRWjXb954=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453450; x=1778058250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LSVksPB9KBISgWBFP1drbkEYrZkCI9LeV+1D+v3UZRM=;
        b=An8v29uHgc61Rp1Ab0K3QBVar7mZ5pXffsY6mMnyacy8huB6YWxbQ0ryNjanbkx15m
         gM7orDnRMzUk2TB6bfO48A2LYOW7weowiuOaiKD67SgA0L7ZAP4QTY0TN3QkpK+Ra8Ue
         eiAwLu1kAZzAlHPpQyRNVL1eswqJsEKZooceC/YaHABui21MhDFqSE9PpfSHdPjXNBG3
         ekmauy0BJ81WO7v+6rtx6B/mJ7nXtXqdOyjeG66ESH+aClfNhigfg2kbxvBsqPZZmlpe
         KGRpXjWIDGCWmPrX+wGVBG42lGe94kXrTF3zsa1puHPmAuG1MXcfgFgKFNZx0fngnWlj
         fEfg==
X-Forwarded-Encrypted: i=1; AFNElJ9R/jbG6YZ9zNajFL4Ja4cr0Y4xFnf+cB28EPA8rXffIpqOVtoYhcMiOp+M5juA6UOp24/pTI9e2gcn@vger.kernel.org
X-Gm-Message-State: AOJu0YwdlrED4FccMyYKjRYFDRNyQnhCPoQ28NSwjGdXxEMZ02pFHKh2
	yKQNxdXMMlYqYKGYxC709jalsciBctnlIkJgvrpzFzEcc7enyf8jBB4koutLwja79EnDbYG3n9i
	D3KMpeA4o1VL23CzeNdG1Vx8qKHpSLeykRtPrx8QP
X-Gm-Gg: AeBDietXQcKYCBjy0DkL7CXtEUffr2HEvEzrWaIsAOvFXqxzZmnedo99MehUs8JEC2J
	jD3YurZ7XPI3f94tS6ZxpcgUyS2YXEXwAJcxkVodWFYUFtgfenAmor7eZyuwB0UrT+Cy/93fGqs
	Ru8J5IUZjuHxeJ2HlTVkk8bkhhQH53lTaOtQdNLk1oDBme8y5LiDUmOYJ3a5TNiJNoALgfvyibb
	R9Ri2mxg0rnzR+Bi1ZjZRoQFYqbAYk3BGSipMUkZstZ/d5bGpM4RkvBcUO6xtN1C9eK/1WKjK7G
	IcpZhOvzi3+GkpzVtg==
X-Received: by 2002:a05:6512:3e20:b0:5a2:b802:8ccb with SMTP id
 2adb3069b0e04-5a746408066mr2496679e87.9.1777453449817; Wed, 29 Apr 2026
 02:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427021021.2049015-1-wenst@chromium.org> <CAD++jLnP9HvWPQg8WqoFkgRoFCWjkOUsRAgtnks4mEhHwYRt+g@mail.gmail.com>
In-Reply-To: <CAD++jLnP9HvWPQg8WqoFkgRoFCWjkOUsRAgtnks4mEhHwYRt+g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 18:03:58 +0900
X-Gm-Features: AVHnY4Ixa_LZNIgCLfsb9GbOKAlcF0QKkeNUnPhDAMaXwaGqxThuDX0TJXAaFJ4
Message-ID: <CAGXv+5Fwc3a-pedzydrE6OiCDS=a+6Mkqm2=3JX2NmoBg0nc-w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: paris: Directly modify registers to
 set GPIO direction
To: Linus Walleij <linusw@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 13CC24918DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35784-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:dkim,chromium.org:email]

On Tue, Apr 28, 2026 at 7:44=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Mon, Apr 27, 2026 at 4:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
>
> > pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> > the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> > Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> > the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to chec=
k
> > whether it can use a spinlock or needs a mutex. In this case, it ends
> > up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> > takes a mutex. This causes a huge warning.
> >
> > While this class of Mediatek hardware does not have separate clear/set
> > registers, the pinctrl context has a spinlock that is taken whenever
> > a register read-modify-write is done.
> >
> > Switch to directly setting the GPIO direction register bits to avoid
> > the mutex.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> You are essentially decoupling the pin control back-end from
> the GPIO front-end, can you try to do this a more friendly way
> that doesn't wrangle registers out of the pin controller like this?

This is essentially following

    commit 8df89a7cbc63 ("pinctrl-sunxi: don't call pinctrl_gpio_direction(=
)")

And in MediaTek's hardware, the GPIO direction is even further removed
from pinctrl. GPIO is a function that gets muxed, but after that the
direction and data bits are in separate registers that are grouped
separately from the pinmux registers. The pin controller doesn't have
to be involved.

> If you insist on doing this, you also need to DELETE the pin
> control back-end function
> mtk_pinmux_gpio_set_direction(), which is what gets called.

You mean delete the .gpio_set_direction field from pinmux_ops?
Sure I can do that.


Thanks
ChenYu

