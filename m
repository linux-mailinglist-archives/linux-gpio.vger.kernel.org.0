Return-Path: <linux-gpio+bounces-32651-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJy6FD+nqmlTVAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32651-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 11:06:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F8621E6ED
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 11:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC4493020FF1
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 10:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E117335C184;
	Fri,  6 Mar 2026 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmLGr3BF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26783502A5
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791595; cv=none; b=cM2cgndasgBQFDSTG24NsB6dyRlakmibJ1/l75dPYOaKrFlayER2KMiMgcBa1HgUoEBuyBBA8HMgQFqLg0yyql1y05b0SMkvHq591Jsj/No7vUtZkpYgR7SdbnwZWvQ8hG9fUAIggQHDYpC2rPqjxbcT1CNb6sHf61lCS4dQMjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791595; c=relaxed/simple;
	bh=JXJtXGAg8MQu4pZ5J5155MH86kt73kFXQ9QMVXqvwB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKJvQn+TIZH2NXzobA861KyToUqkuNekJzlq0OiGxDyf7ctgNSmGzA7R7KwR2PfoP1vhOnmtS6JgEeGbeX65v/IejfvbGCHn40GA9hnQ6RhDtcNyxFK2ptzcNutAOKpK8t/ZZQj6Usr77qrFa6z8ypNkH3ewds2CmOa/KOD9M6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmLGr3BF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65526C2BCB3
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772791595;
	bh=JXJtXGAg8MQu4pZ5J5155MH86kt73kFXQ9QMVXqvwB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LmLGr3BFzZV6cHl9KV+Er9WtMB1su6CfFtyzAwwTJ3R7AoDdLqwtoTQdWHV/vuI1v
	 p8I7df4t1pv6AIE4pjS3oeIo+dOXliEeL2j7hhQFq81A7r0WyTEJZdi3PZXdnl6krc
	 9MlRN5zDQTvJOJZp7gyW92v1SifHX3hMAMG7wttSOLz7A6kpaGmjaALlGBC92w2X5/
	 W1/dEfm/GEgUSKIOYNLfjrbIJ8sxOPPohi+8tfVeZiK4g+VqqSWCYL3UiOi2+0K5PB
	 qZJWth92lSYa+5h8NuRBaUN2N1kGXUPeCKbS/05nhWMInz+JuwuhiHguc9Q8+cz37D
	 ChpKlpkRSlp3w==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ad8435f46so8667412d50.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 02:06:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeJ3YbUVmscIG907wDR2eROAaVoYTpLUEzzWgV14kU/WTBOu3pFUzvavFN7zikLAK323iOSWvYK+v/@vger.kernel.org
X-Gm-Message-State: AOJu0YyvQVXsKfKyJGbGb/lz26csLUKNCELp3eDcVv/OKJnZ+Q8IgrDE
	7nQ1qnaXHerg+kM5PSzlZgydigeB10uKzGjO3SHHZkkM2kXBk/PEvETs9orqZ3Q1GsOWIQzsrk9
	/eatfb0syY39MFDWb154+paWtN5L9QVw=
X-Received: by 2002:a05:690e:d4b:b0:64a:fe95:2ba7 with SMTP id
 956f58d0204a3-64d14164dcfmr1294749d50.31.1772791594697; Fri, 06 Mar 2026
 02:06:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com> <20260306093238.2715269-2-zichar.zhang@cixtech.com>
In-Reply-To: <20260306093238.2715269-2-zichar.zhang@cixtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Mar 2026 11:06:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLm0h+WinA=tsvGreVkuaE-0F3RudPi07fRebpPkfNagQQ@mail.gmail.com>
X-Gm-Features: AaiRm50PL3_GXocU-Voy_O-rzkbVxmBVcCKnixsge0SkxuJu20BGIlgsEq7p28U
Message-ID: <CAD++jLm0h+WinA=tsvGreVkuaE-0F3RudPi07fRebpPkfNagQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: cix: add FCH(S0)/S5 GPIO controllers for sky1
To: Zichar Zhang <zichar.zhang@cixtech.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.chen@cixtech.com, fugang.duan@cixtech.com, jank@cadence.com, 
	cix-kernel-upstream@cixtech.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 44F8621E6ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-32651-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 10:32=E2=80=AFAM Zichar Zhang <zichar.zhang@cixtech.=
com> wrote:

> From: "Zichar.Zhang" <zichar.zhang@cixtech.com>
>
> Add Cadence GPIO controller nodes for Sky1 FCH(S0) and S5 domains in
> sky1.dtsi, and enable those controllers on sky1-orion-o6.
>
> Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

