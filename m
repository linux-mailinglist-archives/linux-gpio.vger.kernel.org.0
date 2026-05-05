Return-Path: <linux-gpio+bounces-36121-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL/bIci5+WlICwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36121-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:35:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3D64C9D37
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC8D830B113F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585FD31E834;
	Tue,  5 May 2026 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJNrpk9f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4BE246778
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973282; cv=none; b=YNa34Gwu5EHiczEAavl7LtGJJLUZe0teAWgLIj/mQn9L4LNHgOkIMPaHC3H2CADvoEYn8J36bC01Jz60xQeFN6gCxADXr6MN/IpOUoAMEivSZXy0xwmFa6XZ7R+MimhAQIWSynHI7/YoLmqGenbgeQqZ/uZAVd7jh2KTcVSknT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973282; c=relaxed/simple;
	bh=ST75s5pCXRQ9EXyKKa8/UBWArfwQnJrZ3RJFZy2Sj6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jr7kJifl5YDMsvEIO5uScV6eqi4tl4A1/tWZmGMf3xJY1m6qwdCXEciIzncwA7ertN6stZV/4KWnDO+f6piOBHyrwlp496IyF0da0mkQ/KdniJqICPhUP8GYjGiZVBkyjVv0KcD5djZwpAy4Lz4ZPNbwhov8RK+nmfxoP4/MwYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJNrpk9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5B0C2BCB4
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973282;
	bh=ST75s5pCXRQ9EXyKKa8/UBWArfwQnJrZ3RJFZy2Sj6s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bJNrpk9fdz5a3bR2sJkzt5T8YRXFVjJxON0dJgQeAr5hLxki5HD4mDJ8KhlFwPETL
	 1k3gKrYmQPHZyF2Vi+fXOlb7878cuwso2gHUFgkHst2q/9yyOMl4gqotqcPgEzCh/Z
	 qbRqNm3K8yftQ4m6SQ3SfTNgHq1Bzt0t6VefJ0ke6+1/T9kQownagCAGrvrpb8Irhk
	 JqQh0GqZyyAscDYXo2QZLgmdiqP3S/oxRXvR1W/gDo8LSmyeNr61fNk3DKqemA3Jv5
	 tSHuRPWTzQ3dWGunrngher3CgPXyuV3yO2fEMOcxE/Z3OwdyqWq/5KE+oIe/2/5RL2
	 XyIXEJIwPoaGw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a884815606so30591e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:28:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9dIXR+wOjwIi7PcLp/LmIwEHttSVHOB31kra/Qf/yfe2K2w9QaWKSDktKlBYYy38xKtgLPddjuReNW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3kuc9wKyN8KUhy4fd6OhWAimu/yi9XO4ejf85LL+lj8VhH/+
	H/BQu/J57tkiWyjwt4xusNzKWxfbLkyyalMTflQNRhNdVnXN5PlC2Mj1lf+7dzVJJqFo6ydcoMf
	lsGywSBHpiirZLdFZ5J7fJlHg5TvMnzE=
X-Received: by 2002:ac2:4c4e:0:b0:5a8:6cab:4866 with SMTP id
 2adb3069b0e04-5a86cab4990mr3169587e87.41.1777973280719; Tue, 05 May 2026
 02:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-sm8150_gpio-v2-1-7d0e052d5476@oss.qualcomm.com>
In-Reply-To: <20260428-sm8150_gpio-v2-1-7d0e052d5476@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:27:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLnG7rDJzYPF-34yxm+LXmDMzu2yrtmqh2qL-azAyEeEgw@mail.gmail.com>
X-Gm-Features: AVHnY4KafC-3EwS9rVOK-fppPkc6hhwVRh-wpB6N0tssxyPV8MAH89nLQkhl9pI
Message-ID: <CAD++jLnG7rDJzYPF-34yxm+LXmDMzu2yrtmqh2qL-azAyEeEgw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Fix wakeirq map by removing
 disconnected irqs for sm8150
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EC3D64C9D37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36121-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Tue, Apr 28, 2026 at 2:15=E2=80=AFPM Navya Malempati
<navya.malempati@oss.qualcomm.com> wrote:

> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>
> PDC interrupts 122-125 were meant for ibi_i3c wakeup but sm8150 do not
> support i3c. GPIOs 39,51,88 and 144 are also connected to different PDC
> pin and already reflected in the wake irq map.
>
> Remove the unsupported wakeup interrupts from the map.
>
> Fixes: 90337380c809 ("pinctrl: qcom: sm8150: Specify PDC map")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Patch applied for fixes!

Yours,
Linus Walleij

