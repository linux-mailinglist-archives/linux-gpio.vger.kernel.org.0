Return-Path: <linux-gpio+bounces-39603-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rtXEFstjTWr+zAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39603-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 22:38:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CD71F97C
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 22:38:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=B7QjtPHT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39603-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39603-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 677DB3017C15
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 20:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A78C3E5EC5;
	Tue,  7 Jul 2026 20:33:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C573DD525;
	Tue,  7 Jul 2026 20:33:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456428; cv=none; b=AF8lW/FAtLtNN524oK7jNPSHnnN/Zx7bWQiryTyMx7yQjW6WnGHliAjLNXJqvs9hiDcRwBW8c7SCZo2J8OEbyJVMK9bVixvF6qNYDhBwTThw9cY8JTsYEo1s/8fxxmCxOVAJcZByp9mmg0tkN6JwzQcHwYOEmSXqp0ENCk7++Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456428; c=relaxed/simple;
	bh=IcWjbsEIwU3ATPx7AA2jXxDrMnVX/LXycwmQTN5/3IU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GZoJNWteJHdNei/3LkUOTc1CE/S0EYHhuTJjatTyq4mJ5ngor/KfvqOw8yhMw9lWIYNsSxMynHx4hk9Qj2snryjiOU2aUszl/ZhD3Yd7Xk5TiGe8ZxtoJd0PfLxR64ISY5r2r7n98e6Yq+RuUaRJ7vQZ0IQVKWHRdH2zD5dhInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7QjtPHT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B461F000E9;
	Tue,  7 Jul 2026 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783456426;
	bh=Q1iXExOfsaeotgqpoEZPdnsrpxa5ipbsTkZFMXWtLPc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=B7QjtPHTANQ/D+ZCE14wB8SxQkuTEv21wgFFB0gIZiYJGOqMDFOMgG94r2FEoncSB
	 iRroQ2HDEuh2RGrlRePBaDxaQhnh/oP/U5/2ceBrQdezbmLkxpmJw5gDCXNMkpR0B6
	 Gfd9cqZ8JkSrfgZQV6TNy7LpVJUKd/zrma8IzoPdEKp3lZxLjohCJ9ik2u0gsBGRMu
	 4LXeOab51Eu/20gaPy1JLdP20f1iBZPYhGodN1eOW0mRVwj7v3ihi3w4414uCUXXQ8
	 6PVEFGqxic8w0nAETziEEtOhoRTcs+nYGertLBXqwx0kOiSlZlh5Kerz94g46wEqzI
	 cx2LGcU3BOT2g==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah
 <maulik.shah@oss.qualcomm.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Stephan Gerhold
 <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v4 0/7] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 22:33:44 +0200
Message-ID: <87qzlesfo7.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39603-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E74CD71F97C

On Tue, Jul 07 2026 at 14:51, Maulik Shah wrote:
> The series has been tested on x1e80100 CRD with both old and new firmware
> and also on kaanapali. Test conducted with tlmm-test module after
> applying [3] as test module needed to be fixed first.
>
> All 17/17 passes in pass through mode and 16/17 passes in secondary mode.
> Failing test tlmm_test_rising_while_disabled seems to be because when in
> irq disabled state PDC is not latching the edge interrupt.

I've merged the first four patches and tagged them as promised for
consumption by the GPIO tree:

   git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-chip-qcom-pdc-for-gpio-07-07-26

Thanks,

        tglx
     

