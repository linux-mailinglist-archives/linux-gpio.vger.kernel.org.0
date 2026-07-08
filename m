Return-Path: <linux-gpio+bounces-39658-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T5J9EuM5TmpjJQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39658-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:52:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B7C726088
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:52:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DYgCb6jk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39658-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39658-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D565E305D5F8
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 11:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A5C433BD2;
	Wed,  8 Jul 2026 11:47:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356B838B7CD
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 11:47:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511278; cv=none; b=f2etEvnXUtSlPuxfnN/38Pasu/lD6Gc+V2YZrNeLI4HhQ5+7sJ+0La6SvfrXl7xIMy57AGaeY69CPbB8EVnc2Qhdd3LtASRjmL77wrVLP47Oz7d5J6e/XaiqyrSUrM3uuu9ssma3iNVskQ+FSPbWDyYzm9VhsmqVvyXWFmBnQEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511278; c=relaxed/simple;
	bh=YgWdbsJ8UAjrSAc8lxvhYVlBDW1BX0UBIoE3vQlrz0I=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gu4mmNWPX1+1RO0dZ6GPaAHk0yN2JTzSYE9VkijW/H2ScKBCcPuY7DjjgAgHTEYJRUY3GToG6hB3MMyFdvZOjTWbqmil6sGoHlHpxLPdOMuDMMiEZi+k5Q+1F9Bw0+I56YtNw45dOgOpZqwbZ5AKqVzFVhapHzrIO9JRmjH/hS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYgCb6jk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61891F00ADB
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783511276;
	bh=Is/wl9YqGLEOs03hX4R7RoncNjfkI3qNnoxCKS4Se4s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DYgCb6jkLic0qWbTNE2U5Q8rIM6eUGaAtbNij6Vq1bzHY1Ltn/mBYLkseMtZ5b33O
	 qL8wEY6z3Tz6nZLLhShS11Be/JrlEHcpGHXBzOuVuYl4M+JmXBcQz3OdZ3bpnd8vhT
	 QyZVoynUpWfFxz4lud+YeTLPRICuvUi10MlF4O4TdXkgxcfCTWsBrljZzPZDOQUoBV
	 cmB70V8shLsdhMzqjwd2BmpF+62Zo6K/RsY9E2QYZIR4o76TGAzYTp6SL+J5ihUa4R
	 OhrO6QsUC6HnM1g2J797OGLWLPSGrT6MMcWW4mcpVkHTibvv6uIxNmPOiyD+eBxF2y
	 eI02GNl8wRweA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39b315585a4so4912091fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 04:47:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqID8s6k+mZddJj9KnI08Dl9Iu/GzKahlBQ/ZXVojfHOiNsVSjhYwRi0NJaS2jsOyo/H4rIXlUIS2f1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1BfMGemCt0EffxZKnfAeKOrFk1kcTLrT0WqY/0MkKrE0/xxgh
	+9KEXzYWpfXP1PJd00zWF7dn1B0vArFUd7luM7YTqzZqW0W0DGsQIpAmrW4RMEzD/SK6RQ0Tn2K
	z2lI+f7PLAep3FppN8JnubqfhlhXWZkeMzzp02KElFA==
X-Received: by 2002:a2e:a5c9:0:b0:39b:a75:e8da with SMTP id
 38308e7fff4ca-39c79852412mr4803661fa.3.1783511275626; Wed, 08 Jul 2026
 04:47:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 04:47:54 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 04:47:54 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <87qzlesfo7.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com> <87qzlesfo7.ffs@fw13>
Date: Wed, 8 Jul 2026 04:47:54 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com>
X-Gm-Features: AVVi8Ccza8OJ5sr4vN3ioNWBzssDpnygJvxLLZvBUYfXYOw5sGKh-zx4pCfo0KU
Message-ID: <CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] x1e80100: Enable PDC wake GPIOs and deepest idle state
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-39658-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0B7C726088

On Tue, 7 Jul 2026 22:33:44 +0200, Thomas Gleixner <tglx@kernel.org> said:
> On Tue, Jul 07 2026 at 14:51, Maulik Shah wrote:
>> The series has been tested on x1e80100 CRD with both old and new firmware
>> and also on kaanapali. Test conducted with tlmm-test module after
>> applying [3] as test module needed to be fixed first.
>>
>> All 17/17 passes in pass through mode and 16/17 passes in secondary mode.
>> Failing test tlmm_test_rising_while_disabled seems to be because when in
>> irq disabled state PDC is not latching the edge interrupt.
>
> I've merged the first four patches and tagged them as promised for
> consumption by the GPIO tree:
>
>    git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-chip-qcom-pdc-for-gpio-07-07-26
>
> Thanks,
>
>         tglx
>
>

Pulled, thanks!

Bartosz

