Return-Path: <linux-gpio+bounces-34193-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NwXExH7xGny5QQAu9opvQ
	(envelope-from <linux-gpio+bounces-34193-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:23:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD6332392
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 10:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D40043180160
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2026 09:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CA73B6C07;
	Thu, 26 Mar 2026 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/oSSJDv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C841336B047
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516092; cv=none; b=gfP+FOJ7I+qhbXc0pHxztkAWFUg38usruoOtK7FvBAfm2dD4JWPIeifdE0Gor3xtrYJeFgwyGwWPUpP42HmjN9lskkggG8ls8Mo1tnXZfD9KD+Hw2S0plLepV9x9vRAIMeA7tHFonjhXossqBRuox/yI1z8VdUUpq201OSxwxVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516092; c=relaxed/simple;
	bh=41uuzIuVnUHcF12QWw7iJwN7+7yOUfnMCa7WCul51hI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAX52cIwChSLxD4J6sL2q5zi4PKA8xMN+yo0eNF68DY9Y5LFKWKLEgGPCgXgvcDxrY6IdwRNvo++FvAcrifBGa+iJERXWf+6NBEl8eEtvI1RJtdnFxDl/FEdUek2ran7Mbdb9CgKP860yhz8K29Df7e+0AeVct05PHEDiBUTAD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/oSSJDv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B61C4AF09
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774516092;
	bh=41uuzIuVnUHcF12QWw7iJwN7+7yOUfnMCa7WCul51hI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=I/oSSJDvc6Y/pMJkMyMX2le1ZAlj+oS1o1nD6mLCVQiZk+rRIr7UrqPb3V59LP9+p
	 i1IOpFvGyeHGd8XivQyKyIjduAefcVznDzwcUxQImJhpo+exRp4sxzJk1UxZC1sm0o
	 81QYZ0YioYwBhWP3U39cyeBRd4mccHLxhse1i4352/kiBqppBqaBtBLj60lGNCxAVP
	 Am6rOzX00abaY297RXRo0kStB142tWPg/Jv+fk9ftu+KgwJ+zPt6cRXbo4sD1b2gBv
	 nLdi19VWzPOVeit8pMY2eqKV0yA9IcTOk8Wt0DPRn7T9e6gAHYyS3k9r19T8ugv32F
	 BT/PA12MoFavw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so939833e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 02:08:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1meOVFkXuPPMNec06zxWwcADnABC3a00bunZmy3lS3IM/J7vrwzFnnN9A0erYtNKt3vSiEV40LmPG@vger.kernel.org
X-Gm-Message-State: AOJu0YwU8MqhGJV+/Pr8Fm5eHVYhgMS+1tD5PbLZX5kJD2GlEQUlmQK6
	iTbQ92QG+YFDl7Rbjqtn+Dw5FT6xzc7EBm2jP3n63w45OU4M89RnnE4oh3Ss15bqDrDPIpmb0fQ
	lW74YObtBq5LhAXLgkbAwByltIvHtzfNvB/lSfLMQ7w==
X-Received: by 2002:a05:6512:3c9b:b0:5a1:1da2:24b with SMTP id
 2adb3069b0e04-5a29b977ef6mr3111477e87.13.1774516091147; Thu, 26 Mar 2026
 02:08:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Mar 2026 02:08:09 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Mar 2026 02:08:09 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260325-asoc-olpc-v1-1-ebe6de05c7e2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325-asoc-olpc-v1-1-ebe6de05c7e2@kernel.org>
Date: Thu, 26 Mar 2026 02:08:09 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdDbm89ST7B4NQ-oAnbvrUAOEmOJNs3iv9V893sWQUrAw@mail.gmail.com>
X-Gm-Features: AQROBzAKakoBErNyz8-Mq8bG92I6QIXY_OeFQgjUDKdMevit95g-8W1xuRNOig8
Message-ID: <CAMRc=MdDbm89ST7B4NQ-oAnbvrUAOEmOJNs3iv9V893sWQUrAw@mail.gmail.com>
Subject: Re: [PATCH] RFT: x86_32: Move OLPC XO-1 audio GPIO to software nodes
To: Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jaya Kumar <jayakumar.alsa@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34193-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5DD6332392
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 22:46:36 +0100, Linus Walleij <linusw@kernel.org> said:
> This needs real hardware to continue.
>
> At the TODO spot, we need the name of the actual
> PCI device providing the cs5535 device.
>
> If we can get this working, we can move over the rest
> of the hogs etc to software nodes and get rid of all
> the custom cs5535_gpio_set(), cs5535_gpio_clear()
> etc.
>
> If it turns out that no-one is willing to actually
> test OLPC XO-1 patches, I will follow up with a patch
> to just delete the XO-1 support altogether.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/x86/platform/olpc/olpc.c            | 33 ++++++++++++++++++++++++++++++++
>  sound/pci/cs5535audio/cs5535audio.c      |  3 +--
>  sound/pci/cs5535audio/cs5535audio.h      | 26 +++++++++++++------------
>  sound/pci/cs5535audio/cs5535audio_olpc.c | 32 +++++++++++++++----------------
>  sound/pci/cs5535audio/cs5535audio_pcm.c  |  4 ++--
>  5 files changed, 66 insertions(+), 32 deletions(-)
>
> diff --git a/arch/x86/platform/olpc/olpc.c b/arch/x86/platform/olpc/olpc.c
> index 1d4a00e767ec..95df7f691825 100644
> --- a/arch/x86/platform/olpc/olpc.c
> +++ b/arch/x86/platform/olpc/olpc.c
> @@ -10,6 +10,8 @@
>  #include <linux/init.h>
>  #include <linux/export.h>
>  #include <linux/delay.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/gpio/property.h>
>  #include <linux/io.h>
>  #include <linux/string.h>
>  #include <linux/platform_device.h>
> @@ -17,6 +19,7 @@
>  #include <linux/syscore_ops.h>
>  #include <linux/mutex.h>
>  #include <linux/olpc-ec.h>
> +#include <linux/property.h>
>
>  #include <asm/geode.h>
>  #include <asm/setup.h>
> @@ -283,6 +286,32 @@ static struct olpc_ec_driver ec_xo1_5_driver = {
>  #endif
>  };
>
> +/*
> + * Create software nodes for GPIO look-ups so we can keep the
> + * CS5535 GPIO driver abstract without peeking under the hood.
> + */
> +static const struct software_node cs5535_gpiochip_node = {
> +	.name = "cs5535-gpio",
> +};

Ugh, I'm actively trying to move away from the "dangling software node"
approach. :( I've been sending patches attaching software nodes to their
target controller devices and I'm trying to come up with a way of automated
assignment of secondary firmware nodes for this particular use-case.

I should have NAKed this idea when it was first introduced in GPIO swnode
code but I just didn't really understand what was going on here.

Could we instead define the software node in cs5535-mfd.c and assign it to the
GPIO cell, then expose it in linux/cs5535.h as a symbol visible to this file?

Bart

