Return-Path: <linux-gpio+bounces-36206-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJzEN2Hp+WnWFAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36206-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:58:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 618064CE0B3
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E897305D017
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E4B42846D;
	Tue,  5 May 2026 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TW8pdnz6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488B425CE2
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985810; cv=none; b=j0VBrq/YAF73dFAO1q9rsGigd7n/JbjGBvHICSo2QAMEcmLcIrB08d+2I2y6zp1EqmG8ksXq5YwVxPxwD0KqHe5Xc3urqdX1ZGdGccTKZyi2aZyL9Z/Nu17Q4CmVd2BGYIvs7hh+keCMq55rhHLhhcqLMgp3liQZ3/1nFfdfSfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985810; c=relaxed/simple;
	bh=ZUs4wo3g3+7GpdmJ7ncT0CXa7bmF1VEsrvwglg4jLoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAH8Tumc4S6LQ/jNa0sseyLT6XYy3fPc99H3YJ7bGn2Pa2L7xk6zAwGgNahUEwa5PmvqsVOvzyX4ohnjUNKph37+dIReAAOPU2B9WvV8DAEwmKlH3cQUaMS/gJkIsBqYWeVVZpNx9mex3kolOTFDwMW6RFXMVtFrBxuQgEYjvv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TW8pdnz6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D326C2BCFA
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985810;
	bh=ZUs4wo3g3+7GpdmJ7ncT0CXa7bmF1VEsrvwglg4jLoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TW8pdnz6ylCu+n5A3jS6uOFfm1r+mrh5QJj/b5ngfXVDaIb6sHGRAklRK+cd8AwyJ
	 LM4uXqHWrv1OQYhOadPOWdI0+97b/ql0+GrGkVegK8/S2QGKL5MSYZaa71wfnd8cPI
	 BtaZlO4QuaxNAyVQCaqeW8pMIP9qhv1FpLcMKgHItIIKnZn+Wc9rdz4yx5dy5wT5PO
	 t/CZudqTq/6Q/Ajl0B6O+Cp5L/3u5wVQrHWbmJYuJ7pg4XoxkaBSFzCIDYWaJm9JQD
	 h4c5Z+uVfXj3DdraDaZGDRkC9kELRIYwtQQwaE2rmuZiTAm9RtmBcbK/VRcD310Tg9
	 A8JBWqsMhnijQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a01c80c34so52191371fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:56:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8n0SnJ3Sm5Vws7lqiKWIDTGWlMyXSs+9orCjnt8jXTg8Q427WQUpmze5pwkBiQWQnOhQi78lXfC9FI@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWKEa88ERMy+SU54BLb3JpuO0EA9H7Zu5S2tBtU/gnaFnN4J7
	yVygdhI8yHz8ougXT9qRb8vFBEKIYaLnCgghGJHS+YR9RjgDAAsg0JaJjiDmblnmUcOAkWbT2At
	sYIMaFIVAZ6o0cI4EVHOyEOZFfP/fcmQ=
X-Received: by 2002:a2e:be0c:0:b0:38a:a77a:b0b2 with SMTP id
 38308e7fff4ca-393785870femr48588051fa.30.1777985808984; Tue, 05 May 2026
 05:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com> <20260505094321.75040-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505094321.75040-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:56:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLn-QPagz4m6jkYU6JJS22cRZrsGA=h20JiSvn-3Pxq=Dg@mail.gmail.com>
X-Gm-Features: AVHnY4Igt9-o67zqCdCfXKKYOq79SDn0cypO6X1gGr102Z0s00tmMJ-a4onPwSE
Message-ID: <CAD++jLn-QPagz4m6jkYU6JJS22cRZrsGA=h20JiSvn-3Pxq=Dg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: rockchip: Move MODULE_DEVICE_TABLE next to
 the table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 618064CE0B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36206-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

On Tue, May 5, 2026 at 11:43=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
>
> Most of the pin controller drivers already have this correctly placed,
> so adjust the other drivers.  No functional impact.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied.

Yours,
Linus Walleij

