Return-Path: <linux-gpio+bounces-33469-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPPiKGrKt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33469-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:16:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2A296D24
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 505A1306742F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E90B38644A;
	Mon, 16 Mar 2026 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBP1cIPn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C426385534
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652304; cv=none; b=iYPTFnkMCMzOktSy239Y6Yb/rcYPDCCAevUf1+BD8Bo+jj0OrlR15z15s6gsMHulB3zfsUJDAJNxY7Ssk8Jf3Tnc7WrGULCwZhBy6lSPKfj0QcK1a1morltRr+7hoP8z3chsOUs+ptEUg1QglhMjIaFQRyQ99b3dnxZMtZCSDVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652304; c=relaxed/simple;
	bh=eRgDzIpVihzA8qFKWDO6rCyQx+ZAknqF06xJ+xnkREo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czLQvjWmPwVrOxqw39DTWuwUIvkBVU2lX5hx9XgKMzUyBWRphObNZWysoTuyq4AVWNfEWOi47VrIb0xJn+wFommM1ilhjRb8TwKnWo+/Euf4FhZakcWbzfStW6ebgA6ahmGUxT4sthqmhZoyfnXZnhW/6o4iBlT1QEEowwxR9mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBP1cIPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24C7C2BCB0
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773652303;
	bh=eRgDzIpVihzA8qFKWDO6rCyQx+ZAknqF06xJ+xnkREo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VBP1cIPnQO3pw6z7lx+RyAB56me0TQ140s/FOscOzGp1wjbNIiuijKx66WIrj9L+g
	 f3ZCDW23XrIOkMBR6pjKYMqwU612JX1r2KnSMLtEPRdfZgbXiGaaao0R+AEtRDKpyN
	 z6V0q3ZosRCl4f2QK+EWOGvkQfJGhxlYlpLUA6IaXkwkzygOHmcpOBgrq0BkE4svu/
	 MY9ZdxMr0VnAUzTUzGOgaMWQ88AH2ezOAKDOx0w+7SRPm2cNy35xfbBTFEfHEe0T/3
	 wHOLkv7ncXOic+w/cbqrVzuJT2OweJ6XIs9scFVTiNpKElg1fu4SLcaYGk7kKj16Jn
	 dYCpyyQiovGLg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a51edef1fso6849687b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:11:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUV0BLaTKrLuUErdUT64Drv6oy3dP53CCSkDZA/s7GlSqWmqZt/Rm4jHFgysmpdbt7VPPEMrZ780uVr@vger.kernel.org
X-Gm-Message-State: AOJu0YyD2s7bRdDGSjfxCh9QQ4BelJEFotDRbul2NkRYoP/2kDyuW3KP
	msxoOJxbwzrKIZhPSxGHCzYUwU7gCWOG0eQEAd4vs0tA+s9nueo5LGeR69E9AgtxGQzMy35cETM
	QTj4ja3Zl4Q4CY/nF3tqte02OpHvU3F4=
X-Received: by 2002:a05:690c:3390:b0:79a:43b1:1170 with SMTP id
 00721157ae682-79a43b11806mr36037717b3.15.1773652303166; Mon, 16 Mar 2026
 02:11:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com> <20260311124230.2241781-2-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260311124230.2241781-2-srinivas.kandagatla@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:11:32 +0100
X-Gmail-Original-Message-ID: <CAD++jLmLTk7qqprV_XkDtrVZae0t1yd-Xfr2zVZw5efJaaSfWg@mail.gmail.com>
X-Gm-Features: AaiRm52aFLNFa5wxT96T98_So20hnNFaBiEWRo13r7VRyT2X_Q2D0tkOX6L-e0g
Message-ID: <CAD++jLmLTk7qqprV_XkDtrVZae0t1yd-Xfr2zVZw5efJaaSfWg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl:
 Add Glymur pinctrl
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sibi.sankar@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33469-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: F1B2A296D24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 1:42=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:

> Document compatible for Qualcomm Glymur SoC LPASS TLMM pin controller,
> fully compatible with previous SM8650 generation (same amount of pins
> and functions).
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patch 1/3 applied to the pinctrl tree.

Yours,
Linus Walleij

