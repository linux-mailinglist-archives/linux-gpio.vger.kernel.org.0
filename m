Return-Path: <linux-gpio+bounces-37708-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPDZCtoMGmrO0wgAu9opvQ
	(envelope-from <linux-gpio+bounces-37708-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 00:02:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0406091F0
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 00:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB67E30179E7
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 21:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304663B531D;
	Fri, 29 May 2026 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BU6MBpsB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131163A83BF
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780091979; cv=none; b=UuhVGDo2HbbrUeGRGdvLf3ip5YBUpG5oxAToFA/JGAL89xUrxw0Ud911UXuZ0rbLkYIQzEl/eZM8hcmmdPmQ7svcoKW3x8237mXYnnBGi51xBG4/z9daNekNTI/KBbLrvbgqYwYU8//y6ErbZ5Ebh8/v0jBhJ7OJ9EgOalNJ6s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780091979; c=relaxed/simple;
	bh=AWNQPph1dBwM6atY/G7aYUANLN9LVL7NPRf2jYbLt6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aou+2EpSaOnqYeYuCMorLeZE/321zTj/ipugWeKu7yBaKXIkV75r0Ikv9MgBqQgAY3tYSLumXVPdCVsI6dePPns4Hcxawfvot+jv2PcrkhzwxS1KPuujlGAHz4k1QMszmghbqhYEGctfIUOwDMgGeJLAwRW30aspJb7hiUBYDz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BU6MBpsB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99F41F0089F
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 21:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780091977;
	bh=AWNQPph1dBwM6atY/G7aYUANLN9LVL7NPRf2jYbLt6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BU6MBpsBDcOXErsendlVPtVfkd+4wYFnkxfYlhru7SoOEhewKiDjXoiBT8Jj5hRRZ
	 xs6EQ+YAf1o4a7TBMq9CI2mQ+pJ/QQLZBVHtnLp8A4hjUXcZyNtqpereFE0LjRPJv8
	 Aq3xL/UUQXj1yUUOdwX4Tdm84CNxHIUyJeWC1YEZHA3IZiSdeFtAnazLEO9cY24nky
	 uSm2eL6/OkZy1FidxnIs0XHv5PQHHeOKe8Bjj/qSUCqVMQHY8sWrWwkvCRJUZlfZUe
	 Kql+HkEm0L6CclXpwSSI28n3TElZOkrdrhoFUi8hCEiE++q3/MiJkenjTReUu3Ky1D
	 r3GTwc5NEgrQw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa4b131940so3629091e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 14:59:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Rs/mCyk9PXhqwrteSsMa6B9zoFZVxI0PNKRn4ynjg1iHf6utTIY94UjFpsA8ouEmL+coC1S4gq3hu@vger.kernel.org
X-Gm-Message-State: AOJu0YxY62JJNH+mCHdRiMojnnyCmoGWh8a7RPAmZNiInCL+FS52yZiD
	c4AigMqQC4FqGUmQDepNuUdZfvExiZQVroIt2eeO8FblcB+N9QTmQ2bkyMLJph9z/nXvPWm/IGd
	IhAqTbFpQPwySlvbIqT+deBfWT1fYm3g=
X-Received: by 2002:a05:6512:398b:b0:5aa:5c8c:9cf7 with SMTP id
 2adb3069b0e04-5aa607c4fcfmr512997e87.14.1780091976513; Fri, 29 May 2026
 14:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com> <ahml-rVa2PIA5DDC@shikoro>
 <CAD++jLmWV9WizdqXfwvTUCbJDisurLBa7sAC6DH1BehDTHZDYA@mail.gmail.com> <ahn9Q-9eHjBSj39h@shikoro>
In-Reply-To: <ahn9Q-9eHjBSj39h@shikoro>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 23:59:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLk7L-XPTpThNbvxzYSuw=Gy-dDci1eTy8wLo9O0o4_uqQ@mail.gmail.com>
X-Gm-Features: AVHnY4J6rdiM9KsLn3kqHZ__ULwLI1RBnXXrtgghRURL6TqmdgUX3m3OAFEYCRU
Message-ID: <CAD++jLk7L-XPTpThNbvxzYSuw=Gy-dDci1eTy8wLo9O0o4_uqQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37708-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DB0406091F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 10:55=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > In case this goes in via some other tree:
> > >
> > > Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > I queued the revert in the pinctrl fixes, you can take this one (2/2).
>
> Is there really no dependency on patch 1? I'd feel safer if you'd take
> this as well...

OK then, you're right. Let's keep it together.

Patch applied!

Yours,
Linus Walleij

