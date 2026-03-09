Return-Path: <linux-gpio+bounces-32790-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MebFhcirmme/wEAu9opvQ
	(envelope-from <linux-gpio+bounces-32790-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 02:27:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B53E62330F8
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 02:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82CF7301B935
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 01:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA50423EA90;
	Mon,  9 Mar 2026 01:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExDbpSyx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602221A434
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 01:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773019656; cv=pass; b=lfB8Y/nB0S6v5AftTLPHovgYTDjmi2Ps70T4CEY84N/9f6m5VbQpqQnhHP6nmeyPmAhdnO3mxjMEDSjvrN6cy4lbTEInhN2vJ4nryfmONHKmXonmsyI4ikMZ63sXXZLfDiDGEedk7aKCJDpG1SA6qMDeP72pQsNxBDi7Bku29bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773019656; c=relaxed/simple;
	bh=J5WOQGgsBgN0mzbAGAd4BjE3fxkas2mV2HC7lbTpC0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4gSP6kLFV0XhlWcTOOtVOAiaoV4YXATKhcXRxEDVupdynw8Ik5rDlEyFe4xQ5LDoQUxjjhk/CNNdZVU6lVEaWHK3tWPwIbEb2R9d2ICHwfDhVsl0ROjjwapEqmts1UJIvru1dC5NhikeZ+mUq33FvMWhnvO9yIZ6yx9WoRarPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExDbpSyx; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-661568ce781so5522721a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2026 18:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773019653; cv=none;
        d=google.com; s=arc-20240605;
        b=j2ZAm8yQJi/2yPZdQOOmPYrw5zB8XBTd3IeXuI7DKMh48dOfF18LS04UZNWERGkri0
         1VcHBBaA0gIu8tDjNJp/7C69Ki4evaEJ/FU6+m5FM3UQjzgyYuBdWMgkJsHoUFASnoHI
         YLjN0go5ArnaBC3w52rgYKJxw9twFUXz3i2GLLBvvH444HmRIkgukAGarRNawP0eTuiY
         MPtNBNVjdFEqSF0QeXeWaaNfBz0VYJ6SYp0Kki9iAG+iERzplKpYBGun9aCTZF5FKmrS
         ATVLXK6J7xgAndAUQapyacvNcmF7uO+wcKvTGm9xUCzJs7e5poqIGYFpc7wpSxRMeTLB
         PlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AmrXqlRa6XqcxgRZeLfPo4HT+SM6fCIjFFPpzWuCXEI=;
        fh=RgvFxTtT8g/x3NjBI+0FVZZ1AJrf7N7mi/I0y/xpXgg=;
        b=iEcTimjqbBeEvEQ6yWEZbF7++R8fFHXA/Q+tQSglCkMQnk70wUjmoyZ4NiYCV0deL0
         zseaYCZ3gOPE7LLcRmJD09+u2osOkyRVe1fm+0TATHXlhslz9MqE/YSj2wn6elHJmrsf
         A1Nw4P9V+sMgQiIsRDn7bE49V053MLecsNB3d/mEigS9hTf4cEtjWBXIHQRNTdxn3osw
         t9D9OrJr3ZSnp7w6kMTIECQa4Gp+/10JUa3hhU1bAyKWhOjaF+ZFl+EF6nUNKfi5zUvJ
         9FIJUwUqOfrFRBrWzWbPYH2TgJgQltoDyXjjoevnFPGeI0iBWlBeINoPGn1emtwQxHsS
         apXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773019653; x=1773624453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmrXqlRa6XqcxgRZeLfPo4HT+SM6fCIjFFPpzWuCXEI=;
        b=ExDbpSyxPuV+FqE+rIosW5MEfnry+p/87P7V4Mfv4FJh95wUHRKzkG6pHdTFplNTLG
         pRmO9rCTizoGZ4EpRPeUKKDo0WlbIN521fDyERWbmaKjH3Njh0S4cBy71iqQlf6WtG0d
         5A4BvRSqflZYNRWR0d/b+vXmPo9CCQpTKezPOT2A/xjH6h7SsIhcXuLqa7fF+oqNYP9p
         xfYTIyZgCJ/EaH579/Y6WxUTERLat+uzBTZHGD15VAxLsIJPoKE42ebuoCpyqf1UJjOm
         JKCm620iLESDvQJ3xBmKQKzKvH4iMPO5VIZXtRWzWfwPcBQ7NqlTfZylsnk2cfWnA8Jp
         zRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773019653; x=1773624453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AmrXqlRa6XqcxgRZeLfPo4HT+SM6fCIjFFPpzWuCXEI=;
        b=jSJv60fqe+HH30DPkuUAGiKJ1sKOaE/OvyIFWUtIM7KLL4veBq25oAZf+buRVkqARL
         P+DMiihHjAH71DRtOIc0aHCJEc+TNs1kDLtF8JHPV0LDQibJn+LhDVSeA7YxPFEObjz0
         O/2uGg3TbcHJM4oVCfYg7hCWMzb7ku/KKJz+jYU8XVram1Hu2BBlDq4zPioPHHrjWJm6
         8WasGLCSv3QLkedSgikW4y+Yu9rWawaY2QHNoyT8IIZsM96ETtPKBsQGMw3S4KrALHd9
         f0M9Zu8VCYuBVjOjHcTijw6GIGasUUD2yjHXKvY982WDW7pybwOfXXBLrOC8dIv4aA/K
         lbtw==
X-Gm-Message-State: AOJu0YxhZ7QHT6J6k1+RKSz0A24QoiNvJJc4K2enag2jP87UZQrjT8Vy
	T1X3wSrdPUnswq37giHQO+p9XKTlkGCDq/92jaWMBlq9si7ysie8mXrPvaSRf2g9jX+/4LBcbdU
	T8oC+1kEiApYbBkWHNHjy1yRxPNJJnZQ=
X-Gm-Gg: ATEYQzz8q0/YCxzbWq3G+YdpJTHYmR9oiXcdvAVfIzkQR76IV2ycu2Xlphd+vkCbY3b
	H68bUB1+E34NepXg5VdgtaPLmA4zbV9bPx8tYTWsRjEa6w4Ri/oZtqDGlPaC4Dq7kQFCV16EOV/
	mcG6K7iywLxHesTdH3cX+4ERP9fxUOjqaMmUk0cmP54QtpopRh48EY6KdigwdefaHqdrBHCfY23
	soPye9KVz+LadlRZgWnNtmHmWPYAhL6OVFHxqrNSMkYij1HlX2PC63+xLZhgHu+aDAQWI0oIn+1
	8akOUG8t8o2O/J4Y4nOXwQFBkA8UL5F5BnLI08j8LZ3KJ0Ax6L88YyQoNf6y4ysRBw+wqly/m7r
	IrSvT4+DC4QpMdu5n
X-Received: by 2002:a17:907:a03:b0:b88:5bbc:3658 with SMTP id
 a640c23a62f3a-b942e02cf9dmr525408666b.52.1773019652375; Sun, 08 Mar 2026
 18:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com> <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
In-Reply-To: <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 8 Mar 2026 18:27:21 -0700
X-Gm-Features: AaiRm51DHUN2l4LTGqNpI9x37mFL5UP6Qa3rL8znqPALUSc2sV8jWzO7K995iBA
Message-ID: <CAKxU2N9JbAzEYfmLpbw5b9Y6MsYUZ1FfLirfy8Hg8MCOUY6PAg@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Romain Perier <romain.perier@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B53E62330F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32790-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,thingy.jp,kernel.org,gmail.com,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 5:06=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Sun, Mar 8, 2026 at 3:15=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> > Use a flexible array member to combine kzalloc and kcalloc.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> (...)
> >  struct msc313_gpio {
> >         void __iomem *base;
> >         const struct msc313_gpio_data *gpio_data;
>
> Do you wanna add:
>
> const unsigned int saved_size;
So in the code there's

for (i =3D 0; i < gpio->gpio_data->num; i++)

which is equivalent to match->num.

__counted_by doesn't support pointers AFAIK.
>
> > -       u8 *saved;
> > +       u8 saved[];
>
> u8 saved[] __counted_by(saved_size);
>
> >  static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset=
, int value)
> > @@ -631,16 +631,12 @@ static int msc313_gpio_probe(struct platform_devi=
ce *pdev)
> >         if (!parent_domain)
> >                 return -ENODEV;
> >
> > -       gpio =3D devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> > +       gpio =3D devm_kzalloc(dev, struct_size(gpio, saved, match_data-=
>num), GFP_KERNEL);
> >         if (!gpio)
> >                 return -ENOMEM;
>
> gpio->saved_size =3D match_data->num;
>
> I know it takes some bytes more but it feels way safer.
>
> Yours,
> Linus Walleij

