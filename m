Return-Path: <linux-gpio+bounces-32105-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIFUDdJlnWlgPQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32105-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:48:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1C4183F6D
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F20B3018AF0
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 08:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3041636920D;
	Tue, 24 Feb 2026 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYiAZt1i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C175636828B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922850; cv=none; b=d3mQPvuCPwQXB5Xgh6QGLdEeD4ErtsMOG1hYYpUargwNVFwaVQyka6fYZGTKzVMmMYNwNkS/gzfYVhV5vJ54UpTx2rNVuRWaS9LgEH8zry74wlSlfxcFsYpR7jLfu4vM4DBaGJ8cQfQ6kTG2LSelgzwcB/zM0wWhCHi504zMlhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922850; c=relaxed/simple;
	bh=i3q7I3HDbIZE2ViLYMXs13uKtcpqu5vabX2yCdjCgLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUHHDK02pnYCt1x1d7JtbjIA+R/Oy5GXCUIiUvG0lKrcNN62pNlD1M/PVVV/1aDlKxFvLBmfAcwkN9vnDICK7vBtbMyibDZkCGrXmhzbZ2HEp8eCxRMM9t5VvuCt5pRinJw7s9syGdLrPvfjMdRqWq3ldTkTd0+HT1FH5aO4020=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYiAZt1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6EDC2BC9E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771922850;
	bh=i3q7I3HDbIZE2ViLYMXs13uKtcpqu5vabX2yCdjCgLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iYiAZt1id1XT0Nc/u2cnzyYF1vFxlrrnblR4MexnicOGKbXsUmmW9KRaC7pnzJoe3
	 n9pVlQRnZfK1cRZ5q7IdsvA7RgA8QqJ+Vwe4ve2T8wlGtOyZ/H8ipozSExf7n/Cvzt
	 KxjobDZg/mFMEqS3/USm071G43KZOdQY9+rPhtQpVHxnQn7VAUNSGtM4jtMrBJW/f4
	 fwZGYYT0eLUzh1NZ1BWZsvEkPUZlVcubUz08mPsAZ1BIS7KC+K7pXFfp6PsKujbQb2
	 hlCA5BF3BZkB8EbhBll//X+vtF4ZeRpEmeCY3wjPFXnF0QoFfrxY+wbVfbkb8CMkxe
	 Hi4Pr3r3Adgkw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7985d11da10so2277797b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:47:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZF3SUDEpPJLeDMAboz9qh+NirUb+Eu+pHnNpXDaaTSvp9FnpHDUlR07pUzKTgQFYeLtrrMhiGt9CB@vger.kernel.org
X-Gm-Message-State: AOJu0YyBiqBGHi8NLw9K4jbcVox2viiN6Crhd1AiHyk30nBYXV2blAU0
	CkJcm9Z96Yq3c/BdOS5XoTbYlIaugKPre5aP11ThOfE40mmwGXpbh0s8HCV7z59/Sjm7HCozn8Y
	nzVPu/2Y7QuLJ/dQS5GkX73Lz0xOfUIU=
X-Received: by 2002:a05:690c:4b85:b0:794:7210:61dc with SMTP id
 00721157ae682-79829190d22mr81325537b3.66.1771922849602; Tue, 24 Feb 2026
 00:47:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-am62l-padconf-v1-1-0bb6f066fabd@ti.com>
In-Reply-To: <20260212-am62l-padconf-v1-1-0bb6f066fabd@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:47:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLnY5Dar4qvBcSiUBgPaDR94b4-ONtuZEaO75Uv5=6foKg@mail.gmail.com>
X-Gm-Features: AaiRm53pigVbE7s4jmjKR7_vFmD2hgbe0l7bXfTTEFLsTkiHi2nSHctBg71UP-c
Message-ID: <CAD++jLnY5Dar4qvBcSiUBgPaDR94b4-ONtuZEaO75Uv5=6foKg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-single: add ti,am62l-padconf compatible string
To: Kendall Willis <k-willis@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, bb@ti.com, 
	vishalm@ti.com, d-gole@ti.com, vigneshr@ti.com, sebin.francis@ti.com, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32105-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E1C4183F6D
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 10:38=E2=80=AFPM Kendall Willis <k-willis@ti.com> w=
rote:

> From: Vignesh Raghavendra <vigneshr@ti.com>
>
> Add "ti,am62l-padconf" compatible string for the AM62L SoC, which
> requires register configurations to be restored during system resume
> after suspend to RAM (RTC only + DDR mode). This reuses the j7200
> configuration which includes the PCS_CONTEXT_LOSS_OFF flag needed for
> proper restoration.
>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Kendall Willis <k-willis@ti.com>

Patch applied!

Yours,
Linus Walleij

