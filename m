Return-Path: <linux-gpio+bounces-39274-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +RBeKArERGor0goAu9opvQ
	(envelope-from <linux-gpio+bounces-39274-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:38:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FEC6EABC8
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:38:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=osN1mJqr;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39274-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39274-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECB0330EC8C5
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEF23BD22C;
	Wed,  1 Jul 2026 07:35:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943D73BBFC4
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:35:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891304; cv=none; b=AxO714jTdv82r8BBwj5tABnkmZfklLMUTbmdsCdmQXWhX1DSACm1B/H3EsJVCcYLHK8QxTMM/fw9k7IJ58JK98L7EyApo19AQdQpK2nqEfhHSX3tRI6yYjyeNaqoTkkjq+rqF1mgWtkj3MsjSRFDVSulK78NSe4HTF56z/etoZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891304; c=relaxed/simple;
	bh=q0YiS8Sz/V8k9lW4bZPUoCWbVx4FeC5IOmAT6kcx+qM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqlV6ZKOqbUrBXCeBneUhejZP1lV5YeWKwnWAyXl+XENaf9jDTvdn7PsBjVkAHWJzWzo6IedvVjGORgtW6OZofRgBS2BPLPqsOhhHrQTH7K2s0r4YphuAO/vlnzEIo4sKUhXSbV3RUVYPNVmtTSPusKRpXwaw+Sn+Elrsxw7/b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osN1mJqr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8C61F00ADB
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891303;
	bh=q0YiS8Sz/V8k9lW4bZPUoCWbVx4FeC5IOmAT6kcx+qM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=osN1mJqr1RZWct1H0SP10vjTdJvJWw8XmcpHfptZM2C1XoJhJzLKoq7wAdXeYb1SS
	 kBeVkZ5xd66Vnqv1Gih/3WRQUp2kubDzTWAQJhs2zo8mr9TEo53KJCosWOlD8oHUAN
	 YXOOHdhAmJL1y2NPzpybJVpi0kzJ7iaLXK/gWaeuF1z3hpcHeJFabxYsJ8r1ebnIq2
	 e7h7qH4/7xew+tHknmi6E/Z3sTpHjxoioPkFFLDUn1HQrEoGGytq+a5H2RqHqqKazv
	 tPJGVpfn0dlradmYxt9dT4C4SuLR6/w4+8FSx3QDNq7mPS6HdAQWPynIcqgvXwh3dq
	 /V7oNjJhWRuCg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b1eb7bd9bso3036081fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:35:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqAc0gEpm6T49+mgjCLr0EGudkxtouJyw4ly3hWE13uwRWLzHG9sY0uIvyyTF6DhbeS+2c5PqxHmxGd@vger.kernel.org
X-Gm-Message-State: AOJu0YxEKLC/AVJ4hMYphpoMiNV+aW37xw/Xe3Zj5bKqkdW+vmGsFHeI
	TvmaImONJVz0+IHFHWVxRoQWNzZV3U/cYe+F6Wc8tJbHp0VhO/l8eTmzHd/Bwt1x5BESNFnoffL
	X0bGl91TmR84MM01aTSU1kYkp4l5NtRiZO9718PVY1w==
X-Received: by 2002:a05:6512:6389:b0:5ae:bf17:c4dd with SMTP id
 2adb3069b0e04-5aec67b8787mr86796e87.37.1782891302052; Wed, 01 Jul 2026
 00:35:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:35:00 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:35:00 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <87pl18qepk.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <CAD++jLk5qmiCTebaor1h4MSRX0mM-oKH-CdbZU9SKq=f3aQVug@mail.gmail.com> <87pl18qepk.ffs@fw13>
Date: Wed, 1 Jul 2026 03:35:00 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md0qkPi9VPbTj+gD2AXmVPXU8H+t2r26307JN_+A7i7yg@mail.gmail.com>
X-Gm-Features: AVVi8CdNFV7POuPm-ZopPVy4oNxDsoya-O6ZC1lgLaAzvcjazPY7Oh3MJrnk-2Q
Message-ID: <CAMRc=Md0qkPi9VPbTj+gD2AXmVPXU8H+t2r26307JN_+A7i7yg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle state
To: Thomas Gleixner <tglx@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39274-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:linusw@kernel.org,m:maulik.shah@oss.qualcomm.com,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3FEC6EABC8

On Tue, 30 Jun 2026 16:34:47 +0200, Thomas Gleixner <tglx@kernel.org> said:
> On Tue, Jun 30 2026 at 12:42, Linus Walleij wrote:
>> I don't know what to do with this hurdle of pin control and irqchip patches,
>> luckily it will be Bartosz' problem since he's managing Qualcomm pin
>> controllers now :D
>>
>> I'll be fine with brining the irqchip patches through pin control if an
>> irqchip maintainer ACKs them.
>
> The irq chip patches are self contained. So once we have a functional
> version I can apply them on top of rc1, tag the lot and merge it into
> the irqchip branch. Bartosz can then pull the tag into his branch to
> apply the rest.
>
>

Sounds good to me. Thanks.

Bartosz

