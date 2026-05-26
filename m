Return-Path: <linux-gpio+bounces-37533-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDAgGXOJFWqGWQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37533-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:52:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 328505D52C7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B5B2300FAA6
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931953E8339;
	Tue, 26 May 2026 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vbmz1ItG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20A13F65F9
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 11:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796331; cv=pass; b=EMqOY77E7YacGoUDfPmlhVlm8Uc0msn8oHrRkvhcYUU/Xv9rsUtcSV7GnWV8bmZ7rLfK/zsZLE8kbjqXqmQNjF41KeDshgDuU4NnEm3leTi5J3avxxNI3vNYeG94zDwM8BOpkYLKeJKqUyB7BWWbp0jfmVJnDWzujPW6VmPeZ38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796331; c=relaxed/simple;
	bh=6xhj1lqt2b2bNz2Qilzwv7dO8Gqe41oYd3knA5L4Klw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JD4a2H35rWN141f4aJZ6xQepbUtUbn9GArRB5MuX6ulPTqwj3Vfv89kZs+3N6TKkcS4LEsrN3wEt/Bk2We7FSnAW8rW+iKOWTNoT/Pvbay8nah3r/hUGO8q9p3f4P86Rt6Wh+fQtfW1QfBWBgE/oEVG6fMW5QRgVDdWillAzu8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vbmz1ItG; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-13621cca8f5so8954603c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 04:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779796318; cv=none;
        d=google.com; s=arc-20240605;
        b=LeOqcfE0S4SD7+us/FujEkmQgMLigAu9Ph9an5cuI9WIgdFHu4pLYSFBcJaW8l7s2W
         hGq2i7ciS2mPPVxg8YLpu7WEy+c7FhR+FuRKMYfRoTwDjcBnbUwxfubeueuehtPPEb1o
         QCJQaWTl7z/VssWnh8doXRTWDa3fOq/buBNYBYlfdH9vAfeMpIQ/jdgVs4zSZDifw3Fq
         eQke9u9WJYtEFIcGLcdUIaGhFIOwuMoFtGDJ3rrvf5LfuedCBouUSUdsz3VxS22CFD7g
         i4x0obKcYZvsMe9G7KyJPa+VdXQN7uzj26eKlRKN8rbeGyQuT5gTPlA4lpAHaW/Innz8
         Rufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+uih+gic5K0dMmIxHvxizREphLsC9XHTiJnGqe/y/Fs=;
        fh=a8Eb0aFr+S5j5eneeLzMP2L1yAfzfHAJfQ4TrRM0fU8=;
        b=jpdTD8AmxPwmBm+9yHDr4JmYZ3IR0ZHlZG8A7XEvBcBlWRYSEz819BU0H7RunKqo1S
         P2927Pd56x08UpUggvwA//TySHLzqN3VlX+cLFwTykMpbzlwVdpRmcSr7Ig8SWz6wd4C
         4n1VFmdgG7Dk3sKeayThQ9HNyLlhIXG7yiWkJXZT7f4oT/7Hl9PUAWBGDZA+BhsWzOb0
         YFOZCEKf1wXMb5wdsL1qjoI2ii1Fhq2R+mn9ehnKXeG/cqwQ3v299B2yUZ/MxCalahqS
         PTLdJtatti52MiX0RCQG7Lunw0/8fRFzS/uljf1qs+GfzhUxrhtJJ47hJ4IBGVfuKaD4
         5AWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779796318; x=1780401118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uih+gic5K0dMmIxHvxizREphLsC9XHTiJnGqe/y/Fs=;
        b=Vbmz1ItGbrA2mN1IjqRYKzUxSxuPTy4V7R5YoMwXOmgIOWArVSNDU5t3EfkEn3O+PF
         4ELh0WujZShdHJm69E0h4BMrXhC+O9lIj9WsjFiU6+/NFEwrZqpVb4m4BOCiCsMsyU/D
         JyYhSupGXiw5OKkW5+ZtVKSXXB8C3StOD5h79/ahHkGm8mesHX5Wuv9UrKeDWuS/CGKc
         X/Sbz6+BeYlOoaM1eATdLGU3Yq399wWNKc5lB2IEum3qdO9cnBc+SEd6D8coQEUIBUrW
         NFN7Ynjtb0Q+zOiFtJYssEk8WTf7vaIF6Wgq6WmmwTO0lgeGumHELmvDRvyFWDva5nA3
         xVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796318; x=1780401118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+uih+gic5K0dMmIxHvxizREphLsC9XHTiJnGqe/y/Fs=;
        b=FqnT2sk9uPyG0LfU/JIwRJYkzlc5xAATAO5I1/HE6hnda1G0d3cpOtlkn3Wocr1Eku
         5ykXtiugATW6F4c0D7xScWYZwqAlHvfehI2/ofTQE72Ro5yQlshlxeMaXD6h+MzNzvoI
         bt9v6BtTyGnPaj0DTmQh5AXsejqxE6fme0l+FG0JFMTEbIHVwgF3A9KiaWnaUwLBl9rx
         bHBGJDDkmkxNRryg32VGtvuSiE7Kizsw/fqo8DHrwbGFRDXHj7/E09uE7hKvz5//RAo3
         1gAsCQJaaTPuZCLWpPG3RE6GP8KZy6ir3dZBHokuxAtLdUWBN0rQpq5uoC1umOVLkGHG
         ZCLw==
X-Gm-Message-State: AOJu0YzTpLLdcjnNv5oWEVwdvrUy6zmHGUPXEyeBE1h/d+3NPU+LUC5S
	qqqLgR1YvihTbqMHw4p2EwKHryCdChofQMx74JLlvq9Lsaj0SHP/Q8wgHj++QwoQo/PsJGQ7PW6
	fzLF66PHGkGHBkybDWr0IMnD8FrAZ0eg=
X-Gm-Gg: Acq92OGXGoDHln2Exfw6q2x7orfV8jYtEdm1jWpX9nTHIVMAkiYVnftrMk7RlEI/4JW
	/KhxBVLamSa8FGlob6DbezPWVDLl46WwooXBR/O5Xe4laQnlODVBlE7/Wg7vy0uICZsXDWbi4H+
	SB5qvWlQxqlTodiufSj6M7EnIrygozsJPtps2RUCG7QGo6FgeBL5sgxIEKf2NV26nt44sTWJyPR
	woRAr+0ZtBGuqjsh2rakLhSHbrISuCu32N90O8NY4cF2PwbosOZOtSmZR51PxzHuoYMzuNSyfMd
	Qom3
X-Received: by 2002:a05:7022:60d:b0:130:ab68:2b6f with SMTP id
 a92af1059eb24-1365f812d70mr6745733c88.9.1779796317642; Tue, 26 May 2026
 04:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMhs-H-dHfQeMxmQYOpVS-tnj++nX5_mNKcu1xot3SQETyh4Xg@mail.gmail.com>
 <20260522072904.2028774-1-sergio.paracuellos@gmail.com> <CAMRc=Mejrj2NedWx7JQvg2rkH4ubWfDMxRdQhAZ5US7p5Ly-ow@mail.gmail.com>
In-Reply-To: <CAMRc=Mejrj2NedWx7JQvg2rkH4ubWfDMxRdQhAZ5US7p5Ly-ow@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 26 May 2026 13:51:45 +0200
X-Gm-Features: AVHnY4LTFCrgQt1AyXLYYSyH6KkUR_RdgHHniqYHODyVx5e9PfVwf-QEG85nCMI
Message-ID: <CAMhs-H90akt3HsR9P3XKwfA65F4caeY1=SZ+7W44iLMmQfW2Mw@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linusw@kernel.org, tglx@kernel.org, 
	grant.likely@secretlab.ca, anna-maria@linutronix.de, vicencb@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,secretlab.ca,linutronix.de,gmail.com];
	TAGGED_FROM(0.00)[bounces-37533-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c09:e001:a7::12fc:5321:from];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,74.125.82.53:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 328505D52C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bartosz,

On Tue, May 26, 2026 at 1:38=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, May 22, 2026 at 9:29=E2=80=AFAM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Regarding the issue reported by Vicente[0], we have been trying differe=
nt
> > things and we are still having issues to make this work. I have noticed
> > that the gpio-brcmstb is similar to our use case sharing one interrupt
> > for all the banks and also using gpio chips instances with 32 pins each=
.
> > That said, I tried to setup mt7621 driver in the same way as you can se=
e
> > on the following proposed code. With these changes, we are able to make
> > properly working the previous problem with the touchscreen that was
> > registered on bank 2 instead of bank 0. Now it is properly registered
> > on bank 0 and interrupts works perfect and the device is properly
> > working. However, every single gpio-keys fail to claim the IRQ HW as
> > follows:
> >
> > mt7621_gpio 10000600.gpio: Mapping irq 41 for gpio line 38 (bank 1)
> > gpio gpiochip1: (10000600.gpio-bank1): unable to lock HW IRQ 38 for IRQ
>
> At which line in gpiolib.c does this fail exactly?

This was failing because of using a linear domain with 96 pins in
total but having three gpio chip instances with
32 pins each so it looks gpiolib found hwirq number out of range 0-32
for the chip and refused to mark the pin as IRQ capable.
If I get rid of GPIOCHIP_IRQ_RESOURCE_HELPERS and add my owns
converting irq into the proper pin within the chip
as follows, gpio-keys are properly registered and also properly working:

static int
mt7621_gpio_irq_reqres(struct irq_data *d)
{
struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
struct mtk_gc *rg =3D gpiochip_get_data(gc);
unsigned int irq =3D mt7621_gpio_hwirq_to_offset(d->hwirq, rg);

return gpiochip_reqres_irq(gc, irq);
}

static void
mt7621_gpio_irq_relres(struct irq_data *d)
{
struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
struct mtk_gc *rg =3D gpiochip_get_data(gc);
unsigned int irq =3D mt7621_gpio_hwirq_to_offset(d->hwirq, rg);

gpiochip_relres_irq(gc, irq);
}

We are still testing but I will send a proper working patch for you to
review and comment during this week.

Thanks,
    Sergio Paracuellos

>

> > genirq: Failed to request resources for S3 (irq 41) on irqchip mt7621-g=
pio
> > gpio-keys keys: error -EINVAL: request_irq(41) gpio_keys_gpio_isr 0x0 S=
3
> > gpio-keys keys: Unable to claim irq 41; error -22
> > gpio-keys keys: probe with driver gpio-keys failed with error -22
> >
> > So IIUC the kernel is saying that the gpio chip is not IRQ-capable some=
how.
> >
> > Once I touch the irq field just setting up the irq_chip_ops on gpio chi=
p to bypass
> > this issue:
> >
> > gpio_irq_chip_set_chip(&rg->chip.gc.irq, &mt7621_irq_chip);
> >
> > the kernel stops calling our custom to_irq callback and calls gpiochip_=
to_irq
> > callback instead and also warning as follows:
> >
> > gpio gpiochip0: (10000600.gpio-bank0): to_irq is redefined in
> > gpiochip_irqchip_add_allocated_domain and you shouldn't rely on it
> > gpio gpiochip1: (10000600.gpio-bank1): to_irq is redefined in
> > gpiochip_irqchip_add_allocated_domain and you shouldn't rely on it
> > gpio gpiochip2: (10000600.gpio-bank2): to_irq is redefined in
> > gpiochip_irqchip_add_allocated_domain and you shouldn't rely on it
> >
>
> Are you calling gpiochip_add_irqchip() in your changes?
>
> Bart

