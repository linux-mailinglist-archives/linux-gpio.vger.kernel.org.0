Return-Path: <linux-gpio+bounces-34720-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PPGJ8EJ1Gk1qQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34720-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 21:30:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 176453A69E0
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 21:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E36930242BA
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 19:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC118396D1B;
	Mon,  6 Apr 2026 19:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpYt8ULx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A178396D0D
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 19:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503804; cv=pass; b=MRv64Yl7ZejW0WwsqqZBTnkWvtwjp9diGSzpeba9pY9IIC/Y3bRJSi3Cb/pZTEQNCXbzOJWrgOt49EQTJxv0882GRygTyU0ipNqyfXoP+p7C1igsdVY8P8L45P43vvyNoB1MKT5zpkJFELin2y1x6k50wZNSek4aAeAArCtISG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503804; c=relaxed/simple;
	bh=E91vaeMNwDF/pEjv7G2aprNsjDohPpm/gfEXupHR2kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obOxRoLgo/7J++g/nIgMu1UPAoAVSe6aMyNKWM4rKGwm/9f/e7YzCJSXQFYh6tFcs8+W7V+TViSHY8EkAJq0QPr8o+Yg8tTeghVzS++5ROe3mJNXCxYibKrNt6za4PxsGjtUOLjSppHNy43NCh248tMJRj6yVpxw8YR/KZ5umXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpYt8ULx; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so2463045a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 12:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775503801; cv=none;
        d=google.com; s=arc-20240605;
        b=Z5B1jYuKiCDkM6sjbusD97ic9kCNnaWhkLAPzGuRuyEocXVgZjS7fX+lXbndDQnvhd
         2xJqLyvtSaWON/0IevLeJvj2XMoDlpjxWuoJeQZOQDgOiMBkTuQ2zng5MyLw8J4qJ0sX
         8FZ5baJ1gJN1+L9EnN/CR5bGpsyoTEfGNEQcWZQ++rYKSCw52NtVk3ixtCUlc1rlDsTE
         TVucDDzv2V36V0/enzMF1fUbnNXdkDNTB9Z5KqS96IfTGDvawcaeenv1o9Ys/d+kyAbx
         boD4JrhUNUJK2nXaQo8VPWj64uVZlW6eq97yBEz/2nlHCBGlQQO4vyH+wHmRrFqzKkP3
         2j0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6oqpjiW2BP+Tsq4RmXpwQJ34Z4G51X+Eu8RZMOYwNBA=;
        fh=9cE0lbZs6InQy42N/8iTfci3jIyEA4UqEQsqEEbbNMg=;
        b=FKxb0eL1+xqH1DhX8HjpbREMDZm5mUDA4Xi9kq5de0yot8Y6RLSwdSBC55yjSthaX4
         uHAk3nObGCv7hCA7t18V8Mld4J9kHAM20M4Z3gv0Vwa0JYKeqZ6WotshcMR3hrtePUKm
         k45yGtpDC1UfDyTFAUG18f/EtZQ/8ZGhkRivUzk8KvL8BsxBbUymk8fvyzs0dKYPOY6B
         Dyh1cebVI+zNfy/hyMQ/C3oLheD7OKa/84VZTYgR84eo7sjtweSkeXlm/l/vMUiGn+Hf
         l8n8paxMSK6d4VgwssYih2F/t/xKeuQJSl8y2wZzD5MhYqV0ik+NhZcGretZLnDt5Vxx
         LM2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775503801; x=1776108601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oqpjiW2BP+Tsq4RmXpwQJ34Z4G51X+Eu8RZMOYwNBA=;
        b=fpYt8ULxqnw2GUbo8PxtOmsJkkZtVysEaDZlyc4h2P68GO+cYulde84SIJ0uydhpZx
         jXNxQ9O2Gp2cuhIi61UgF3kYmIp0wsH6hphdOhhfWsv/rcIlbgPOzmweaqa3IgtwuzP9
         PGx5z6ohMvudLwSjIw93Q7vdhkwWj/QFO55A7+teVpb6rtuH474NgoX05nB2PuJumkIA
         SbfOZSaseyOcdue3nC51ekx29sYKiCI528A3gJM6P3mDHj/Bib7xmsx64QruetIGRfSe
         g7O7sqUO8j7eozf+iBdwIQCQgVMAopcZ4hX5BfHAeP7lWhUUHW9DOwoC0Z0o7v18+9wK
         9bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503801; x=1776108601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6oqpjiW2BP+Tsq4RmXpwQJ34Z4G51X+Eu8RZMOYwNBA=;
        b=l/7LO/ScWMOvgNNaqFVy61Yr7Rv2LvHhDajB98YaLnOGk5eDlVKxU/oACrxCxfgaH+
         m/7DCFQomGG8Zv3EhSkkJNmoXjPNZJgNZ2vHgoeLCflVaQ1F4tjMG1xWEOS4UjloD9bp
         6ZmKFRTzsrBm1HIEf3F6D/0vVCQOAPTzprFQE/EAqVtrfppJHBIXioYxLlHDKAP1wg9H
         Kbd7XcxVHMsbzDMwtx30I1QexBTR24taxpmJoxG1eOmnGJsAn7KJiMYQawR6lJCZWkuR
         2Cs8j0DkbjSyIU7r1mVvgCg+j/uLpAWWeSz5tbntBO1bECTpfFYyJxQVHqeFW83Z73Pi
         9XRA==
X-Forwarded-Encrypted: i=1; AJvYcCUPnvhIrzAtx7J1LZhWC1Ss2N1ZwC0JXgbTVh12CUTW+fQPZQEXMEk4AuQATqIPJ+jgcYo/p1vEYT0h@vger.kernel.org
X-Gm-Message-State: AOJu0YwqV38HpZsyaYkZm+Wq4nbS22J64OptLU8zeq5i9dFksedlr8N+
	W927Drx4CX/GZxZJSdpgK157TJZ8YoHrx3o9TkdeTiAtLkbv4XwFFwI64LTYrPXF60dsVLVwsPn
	0nGL9CCBgdLfMRy7XiHc2RrIgUX4u7jE=
X-Gm-Gg: AeBDieuDNYaUcMeJMxxhrjZFAWaGxDp6kaj5g1ttcejF4z02swAaBkrs+HKjvmwy9W2
	5Bl8LjYUEB2Z1CUg3wIl25j7ZvzpijNk3rRIpKjv6slHmYc7hk4OQUamPjvRqm6ho+3dZcnOlPm
	cXTcGuIa/GZBX3CcWqZAGlWA+GIkKlp6jhyGrf/oNvQ7oi/tdRuCmBXsaXxbVSUuGymNX6seIpE
	6indWSt4lAYtv3EgOhbEXO2lU4TUYxw2Ot153fb5SI80ZD+hNXyZ4g8OOP+UIwkqYuGbQNnHU17
	lB4WxWd9PVAp7TYAfDyKumw5+csTwgc5HbypGF8W4/4rCpyQS5bw12Wtv4fOjOwATwphUh8U4Xp
	Qtv2sFUjpHjUOrPHvDQ==
X-Received: by 2002:a17:907:d87:b0:b9c:b069:8ac3 with SMTP id
 a640c23a62f3a-b9cb069bac2mr337550766b.3.1775503801341; Mon, 06 Apr 2026
 12:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com> <20260403-swnode-unreg-retcode-v3-2-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-2-7886092b28b4@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Apr 2026 22:29:24 +0300
X-Gm-Features: AQROBzA8JV6OQ6clUVeDdQ8y2N7R8Nc6EH_ZR0i5RXUt9ZfYunTBiDn_zltZ3Uw
Message-ID: <CAHp75Vca5R82wEV1hAyu1=zkuQOw3htXT787XhGH+LVN+EHQHg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: swnode: defer probe on references to
 unregistered software nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34720-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 176453A69E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026 at 4:52=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> fwnode_property_get_reference_args() now returns -ENOTCONN when called
> on a software node referencing another software node which has not yet
> been registered as a firmware node. It makes sense to defer probe in this
> situation as the node will most likely be registered later on and we'll
> be able to resolve the reference eventually. Change the behavior of
> swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
> resolution returns -ENOTCONN.

...

>         for_each_gpio_property_name(propname, con_id) {
>                 ret =3D swnode_gpio_get_reference(fwnode, propname, idx, =
&args);
> -               if (ret =3D=3D 0)
> +               if (ret =3D=3D 0 || ret =3D=3D -ENOTCONN)
>                         break;

If I understood the logic correctly this may be just extended as

  if (ret =3D=3D 0)
    break;

  if (ret =3D=3D -ENOTCONN)
    /* ... */
    return -EPROBE_DEFER;

>         }
>         if (ret) {
> +               if (ret =3D=3D -ENOTCONN)
> +                       /*
> +                        * -ENOTCONN for a software node reference lookup=
 means
> +                        *  that a remote struct software_node exists but=
 has
> +                        *  not yet been registered as a firmware node. D=
efer
> +                        *  until this happens.
> +                        */
> +                       return ERR_PTR(-EPROBE_DEFER);
> +
>                 pr_debug("%s: can't parse '%s' property of node '%pfwP[%d=
]'\n",
>                         __func__, propname, fwnode, idx);
>                 return ERR_PTR(ret);

--=20
With Best Regards,
Andy Shevchenko

