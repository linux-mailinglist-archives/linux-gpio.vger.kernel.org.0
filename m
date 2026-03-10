Return-Path: <linux-gpio+bounces-32984-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG/rNZcZsGlAfwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32984-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:16:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4F724FD76
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 14:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB17D33CF17F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F364039ED;
	Tue, 10 Mar 2026 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pnn/vg+W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A704E410D15
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144235; cv=none; b=HPAGLmYcevsPmX8HXjmpBUV6QFtjsbIiMSI5LXX1pFZKYrf6+5/KaNFiIw9/OPrwvlVsaFSd/l2JZHgKKi/2HFPMvQlScOF8I2jsD338KDAPWiU4hWnhuIsipAQUPRc4RjSlOmwgEiKcM8oVbDwmhYJ3AjIyL5I+5a45pUTfUjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144235; c=relaxed/simple;
	bh=ejvKQJ0BUEIYO8YyNFJZK6EePkf04xdfkGOlJrEYICI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Km6mPrjCGyXB9Huc7+K//XV1+kgw5HNb4RfopJmc9gIAnPU+kBjmuKqsJVy3PJCS7ColBVCSqCc5hkwKdyO/pjwZ/PlxWb7DS7nKsfNjJYzRc1B49qAuPuN5AOa9DONxEh1F4kLCZBTShMJZ0T9mc9m2hDwRRV7m1gN/qU8NdNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pnn/vg+W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6101EC2BCB4
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773144235;
	bh=ejvKQJ0BUEIYO8YyNFJZK6EePkf04xdfkGOlJrEYICI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Pnn/vg+WltwVVTkjJiM19hHcrRXtoPtor7C23uNtus7c+cIENikuD5uQXzzOrKwAe
	 Mepx7a0s9FmnahpgfvnIi2YoN1TDpeNh9T1d8gWWRw03kRr5JaZxm57G4YENIPOQZe
	 5wx0XL96edi28WWewbAbGHF9U31NfzmSCzig+7x5ltEGOTy72udE8QNzEC+tJD9vqf
	 W6JSH/fT28hmdOn79e7H5T5W0oc0K+M1HZPLJW2oZES2Tbt94JkEPzdeEnQKc2cttc
	 o1ObXW9bSnBqUu2uFdmd3yTKy+7X1715NyfX1J7QV3sUSDnOn2tUCJe5wEl5KscpId
	 bK8J93Z5BEB1A==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a38ccc217so38994281fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 05:03:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAC6n2T0clJoSmS9kO6xtp/800zIPnMpQRZ9TMLFizfoMFWDUS+olciuPOMvyhWCbGW/WvFrAIp8SR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2RfwLRyfsxeSYnhM9CZ8hGXuNmc7EzaIKUaQc/uuW6dOwdYoF
	KlyajaFO0z12ZQvA74UhwKln+tfXIk2AARQ3j5cAwapO4juiwcsRKjqJhssLX2n1GiIofXKLoVR
	5BrmJ1buLPvJtJWGBvt7tpdurWvqNkFY=
X-Received: by 2002:a2e:a546:0:b0:38a:5402:a9e9 with SMTP id
 38308e7fff4ca-38a5402af62mr27099711fa.5.1773144233600; Tue, 10 Mar 2026
 05:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224092419.1275016-1-wens@kernel.org> <CAD++jLnKxDi1GCp94zAUKhwBvQwVAdT8bgNyw5XM2+PTOhxq1Q@mail.gmail.com>
 <3x55nsighrqdo7al2n5imlov5yoti6z7jxrj7yieeghyqkllvb@akbuob4n37pq> <CAD++jLkEKprZ_qraCSMq2Zcz7ueiJaOEX6iQnMk9=Su-LbO6xA@mail.gmail.com>
In-Reply-To: <CAD++jLkEKprZ_qraCSMq2Zcz7ueiJaOEX6iQnMk9=Su-LbO6xA@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 20:03:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v65QfrYuv3mLnHneiv7hJX00zXhrRQ5ffLv0qDYiSf0E5w@mail.gmail.com>
X-Gm-Features: AaiRm51dUfCJeT2mVGemMIzLa1HTaQCPrrr1QohizDFvRW1zlr0AxQq85bAXp8g
Message-ID: <CAGb2v65QfrYuv3mLnHneiv7hJX00zXhrRQ5ffLv0qDYiSf0E5w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Linus Walleij <linusw@kernel.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, James Hilliard <james.hilliard1@gmail.com>, aprizel@wens.tw, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5E4F724FD76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32984-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[mmpsystems.pl,kernel.org,sholland.org,gmail.com,wens.tw,vger.kernel.org,lists.infradead.org,lists.linux.dev,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid,mmpsystems.pl:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 7:46=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Sun, Mar 8, 2026 at 10:34=E2=80=AFAM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
> > On Tue, Feb 24, 2026 at 10:52:23AM +0100, Linus Walleij wrote:
> > > On Tue, Feb 24, 2026 at 10:24=E2=80=AFAM Chen-Yu Tsai <wens@kernel.or=
g> wrote:
> > >
> > > > After commit 471e998c0e31 ("gpiolib: remove redundant callback chec=
k"),
> > > > a warning will be printed if the gpio driver does not implement thi=
s
> > > > callback. The warning was added in commit e623c4303ed1 ("gpiolib:
> > > > sanitize the return value of gpio_chip::get_direction()"), but was
> > > > masked by the "redundant" check.
> > > >
> > > > The warning can be triggered by any action that calls the callback,
> > > > such as dumping the GPIO state from /sys/kernel/debug/gpio.
> > > >
> > > > Implement it for the sunxi driver. This is simply a matter of readi=
ng
> > > > out the mux value from the registers, then checking if it is one of
> > > > the GPIO functions and which direction it is.
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > > > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.=
com>
> > >
> > > Pulled out v1 of my tree and put in this one instead!
> > >
> >
> > Please do not merge the correction yet. As I was pointed out by Jernej
> > Skrabec the solution is faulty and just cover the issue. I will provide
> > proper solution as soon as I find it.
>
> Too late, this is already upstream and I think that is how it was detecte=
d.
> Shall I queue a revert?

Michal sent a v2 fix [1]. It's more of a workaround though. See my reply [2=
].

[1] https://lore.kernel.org/linux-sunxi/20260308-rc2-boot-hang-v2-1-516fdb8=
20953@mmpsystems.pl/
[2] https://lore.kernel.org/linux-sunxi/CAGb2v67FO1bt3yee2SXn1LTt7O10z1EHHw=
7F0xQ0bKbpUqch4w@mail.gmail.com/

