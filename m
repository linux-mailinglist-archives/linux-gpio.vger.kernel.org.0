Return-Path: <linux-gpio+bounces-37074-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id L6H9ESMkC2qxDwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37074-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:37:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F1B56EF53
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BE613012C41
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7BE351C31;
	Mon, 18 May 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5Hc8VoZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E40377558
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114426; cv=none; b=soWCJQ+gU+mUuwIUkqNyim0hDEeGjKbRXLOMNprxf9lzRM40zUyrRNuyZezRF2BF/Q4y0oGk/svq3XnuukmyvWHe1jDnKmJAwSwPOMeZ7H11a4jom5Tp3IiZdHIql6NB1pv7CVTlpK/M77ysmyi90q8i4+Goh2CTjEGRK6OOE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114426; c=relaxed/simple;
	bh=QFKCRBkw6wyk32g7EcU/VvBElanIT53QeKHnqAjjJ1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOaQS1Xcrkw6w12fPHRrVlwQBlw5CxhindmdmkN+Lv22HU+EgJcgKkD48pOzBUDyJlTlfFmBxOoh5xMY9SCqkq35tOEXfbNO+zWFp5DsFk1BxgS7sYw7TqioXJUzx6HHi5dijkLcKLSI96saACdnkLhAShNLS2Gvpyul+XN/PWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5Hc8VoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E509AC2BCB7
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779114425;
	bh=QFKCRBkw6wyk32g7EcU/VvBElanIT53QeKHnqAjjJ1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D5Hc8VoZlkbAtTbKFjQGSgx62M/jeUhp3pTpazaYhIl4DYyaz5o4mNrjZp49wc06h
	 MLxb7Iu4JdpO2bBMTwuDcv9+e+13Lx0CbZLbVX9b/EzM+LTGxo2nb5DwBr60KTPTV0
	 RFOWd/Slgo4P+RC87c6+LpzvJ4EntkQ1usmO8ntJQUnl65NmT2C9Y2+WyJHKq3QbJc
	 mf352hdDhrxJHaN0IkfpnMHfuQp/ttgt3otuGPBXZIm4GJT5fRkDOrRf62KTSMUW0/
	 lclexlf3O0wUKt7mwhP9wGS/3dwX0vtA45WUqwfo6Lqj7xLEnj4njWpKNwlqYPWne7
	 b3SESNQ+npodA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-393800f638bso19634521fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:27:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9GvZnIkCYhSyh99GIFdY/6xTLerFVFLhu2n0jvt/0y5MkYkppnGHmMap0P4DEK2wjygI4ccs+1+OR0@vger.kernel.org
X-Gm-Message-State: AOJu0YxwgJEzWPDzDGRQHdpU3lC19+BVCSRl716jPibuzNp4Bm6T6q2A
	m52ON5TrqxIgVityDfv2S8yaYu67amo/hNNb3/vy2WUau/5+ghHVux8rbX6slhUS5EmDSUnbHoQ
	0qd6f5SGG80EfFtWsA+RlEKjpOpWgNIze/lVH+mJ4ew==
X-Received: by 2002:a2e:a995:0:b0:394:184:f7a7 with SMTP id
 38308e7fff4ca-39561ae222dmr48221411fa.6.1779114424599; Mon, 18 May 2026
 07:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com> <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com> <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
 <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com> <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
 <CANTFpSUX5rYhuTQH3dTTvzW+_yhW8Gs0U=A1t_8LDzKz4dzzAw@mail.gmail.com>
In-Reply-To: <CANTFpSUX5rYhuTQH3dTTvzW+_yhW8Gs0U=A1t_8LDzKz4dzzAw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 18 May 2026 16:26:52 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mewi_cbvpZOgYy3RL2rxuekRhVXD8BeCFUuNSKipTYA9g@mail.gmail.com>
X-Gm-Features: AVHnY4JRGrxRfCAxcwWRlWUHU9yFELT3JlosqIIXUMuAWvUX4l5rrYsRQod8Grg
Message-ID: <CAMRc=Mewi_cbvpZOgYy3RL2rxuekRhVXD8BeCFUuNSKipTYA9g@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	basavaraj.natikar@amd.com, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37074-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 41F1B56EF53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 4:23=E2=80=AFPM Hardik Prakash
<hardikprakash.official@gmail.com> wrote:
>
> On Mon, May 18, 2026 at 19:35, Bartosz Golaszewski wrote:
> > What is blocking the pinctrl driver from probing? Does it return
> > -EPROBE_DEFER for some reason? Pin control core is ready at
> > core_initcall() so it should work in theory.
>
> On Mon, May 18, 2026 at 19:16, Mario Limonciello wrote:
> > Please try arch_initcall instead.
>
> Tested arch_initcall + patch 1. GPIO 157 now fires at 0.255s (earlier
> than any previous boot), but arbitration errors still occur at 2.309s:
>
>   subsys_initcall + patch 1:   GPIO 157 at ~0.310s, arbitration errors
>   arch_initcall + patch 1:     GPIO 157 at ~0.255s, arbitration errors
>   patch 1 + patch 2 (v5):     no arbitration errors, touchscreen works
>
> The driver is not returning -EPROBE_DEFER. The problem is that
> amd_gpio_probe() hasn't completed by the time i2c_designware fires,
> even with arch_initcall. Promoting the initcall level gets the driver
> registered earlier, but probe itself takes time, and i2c_designware
> catches it mid-probe regardless of registration timing.
>
> This is why device_is_bound() works where initcall promotion does not
> =E2=80=94 it waits for probe completion, not just driver registration.
>

If you added wait_for_device_probe() right before requesting the
interrupt, does it help?

Bartosz

