Return-Path: <linux-gpio+bounces-34933-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIrbHalq12myNggAu9opvQ
	(envelope-from <linux-gpio+bounces-34933-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 11:00:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F4D3C8217
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 11:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 627183021EAC
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA483822BD;
	Thu,  9 Apr 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtH5qKdL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64A37BE85
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724838; cv=none; b=ZJkHZQNJl2DoyTl69n7sZz/aDYeKc2NTOD8smQ8iixXyy+We6MOEnINSZ/wkWHsTqoTP+IJUIEnbMok6LzrJmnfOjWffi4pr1JFJJsXmSoCQSz3XSV69bPiUhV+rN/PbkGyhsFOg3oGvkv9eoMdA4fRFgZqhYlm5FKpOLZXONxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724838; c=relaxed/simple;
	bh=VPUYR4LP+0KATdMvEmZX4SL61Dntc2f7Qo3SSh171vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqF/k4KFHOhOl0mLjctivENaOYwBT4WuYtmm2VnVTTdN/DQyQro8bH9IkBfjXQE62tgxDh0jvXmuQ/tUs74+81OH9XILknHAsQzX2QFgGGqE1S8mGq+U1G+aezNeA2FoysAt6bLvYPM4wC4oMyNXyc9NWwPFY8VvFE3bi33ffM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtH5qKdL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61626C4AF0E
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724838;
	bh=VPUYR4LP+0KATdMvEmZX4SL61Dntc2f7Qo3SSh171vM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EtH5qKdLmmztI9hjq53SGVlqeGinGzRUR7gz/+Zrn5X4w9z9cuN9ruUVrtFkMPp7a
	 h0NHqvMCjxxO/T8/hByT23Aio/UQsc1M3CtfAxfCpkQ4Gjdlxi0F2mWz86AfUVzca0
	 Cw2A9hM5pWyYXzq+NMXxgLO+iK+LYowV3zmv7eO+MYufuyAqUcazrElKZIF40+8xEK
	 0EeoRkjOxicLaeaKrKnZbyG8Wv5uMq7NwV3TsLQmCDeWFKF6K3t2KIHRG72fIdZS6+
	 rOpv7K8FeR7scDrduKrrVxK0gIYhwhnHXDc8tuJhqwdNuqT0a5unE9vUqbs4NZcANy
	 wZdKmfmpKak3w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e4a04f059so549238e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:53:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKModv0B7Ib/PoBU7JE0QmJwLdFlNO9vg7sMUsguxG3/Cpk4ssrQIVOcpTEe0uQbylCcQaEnEO+fh+@vger.kernel.org
X-Gm-Message-State: AOJu0YxNfxNftSKxHfmJPYSATY7HZOjvten80oFCAW+RrV2iZrgR7asj
	clj335QpnvnaJhKcmkT7hK6KXJgPCLdoVEqW5t3JlcEi2YjKJSqyM3QhcWa24HN0qF8NmJC5DHn
	g6NRd6G/JY9TtHdm1K6SqPS5V8KJzixLOa0YuYsQUcw==
X-Received: by 2002:a05:6512:a93:b0:5a2:ae27:c879 with SMTP id
 2adb3069b0e04-5a3e7b4b5cdmr993856e87.29.1775724837082; Thu, 09 Apr 2026
 01:53:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
 <20260407-swnode-unreg-retcode-v4-1-1b2f0725eb9c@oss.qualcomm.com>
 <CAMRc=MdWSigDmTGSCe-ggAC+rKcCLimKgKU_kAGh5N66jyXGtg@mail.gmail.com>
 <DHNVOVO67YMW.1Q763BB153CGF@kernel.org> <CAMRc=MchUSdWo=BXrYN-qS3YFer2R3J02HyJxKJje-a1QvWdfg@mail.gmail.com>
 <DHO01A7B9M0Y.1QVVS8600WRJ5@kernel.org>
In-Reply-To: <DHO01A7B9M0Y.1QVVS8600WRJ5@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 9 Apr 2026 10:53:43 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfX8D1xM+BLCMO75zxQ9NTKtYBLoMPiXtbqUmOn+o9K_w@mail.gmail.com>
X-Gm-Features: AQROBzDr4oZI_GfUCnBWYgDbtcc6blX4QnOeCr1x6uj9MPbAiBva7WK__bUOmQw
Message-ID: <CAMRc=MfX8D1xM+BLCMO75zxQ9NTKtYBLoMPiXtbqUmOn+o9K_w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34933-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C9F4D3C8217
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 8, 2026 at 8:53=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> One additional question though. I think it should be fine, but are we sur=
e the
> change can't regress other subsystems? It seems some of them (e.g. sfp-bu=
s,
> v4l2, iio) special case -ENOENT.

It seems all users check for -ENOENT for when there *is no such*
property. If this does break anyone in next cycle's RCs, I'm here to
fix it.

Bart

