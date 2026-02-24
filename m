Return-Path: <linux-gpio+bounces-32107-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNvYDp5mnWlgPQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32107-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:51:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AB818400F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23D7031861AB
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 08:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5A734CFAE;
	Tue, 24 Feb 2026 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDEhm0Vf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B931368274
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922914; cv=none; b=ANZoNxSFGRdDRbvmmAZQFtmcFNRmYFhxyBxt9+KZ3AoKLJbdX99hgjqQ0gMWlTtuzJPQX5lq1/78r9aJqm8hGqF7ZCuyDQ5EH9esF6Av4qi+QOpsYHTi8ZFkVSTYrDmyo0Cjp++OQ5Pg/pIC72K/s6jQp4ai8h3mBure65Gd8x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922914; c=relaxed/simple;
	bh=pSAr9mSRqnuP5eB3wK8k9lFdg3CWfDNXCKT4AlbOSsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKQI/lL7mEOJIpKebHHKoW5uq5pBtcMxjZ6+nqthO59Upz+5OYy9aEn9l0iIrdSyWeAF8P3pfS+hvTtPsk9g6txW9vTZkwJffab/VPJoRSfSWvuMn/SWHIrMC9cqSzsRvCdETna/TYeumnLNN+oAgYIq6x1zaSZKSy7RYZs6etM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDEhm0Vf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D958C2BCAF
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771922914;
	bh=pSAr9mSRqnuP5eB3wK8k9lFdg3CWfDNXCKT4AlbOSsQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=JDEhm0VfnVUPk4ssXWGGTWkmR8AaLG/WV5ab2r6Iec9YoFnPShCISi56VKMt/f6UZ
	 6xeHK+go4RAUmZuHmLXPb4KI5dSLN50rTA1kHXvimJeQSdaG7LT1XuTQnooqqWF/+9
	 JgYsUhUdPdEaCpsu48pxsQc48kDO65rIfJRzFaO8/WD/nyNiRRwmQuu4/NACY9gINC
	 rUz82hfyWz8Old8fKM785fql9ruesgiVvQvF7PRbdJTsZuhCw8xyVcGqBhGJU56wU7
	 nZ/QT+ZAP+8BFmqoTsomsiDlHZi+ELZoplJnEWwJSslToxaQRomhPH/pAhKBNc/C2u
	 NJ2IZzvUWcISQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3870902760cso44980381fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:48:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrY4Yj1FdDmv8z9J6g3Qbw0owVlnWKpu6DKJQN4W3pmIcLMyexcnkZpFittPoFw6GwTmFCVeiEbzpl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8vb6R6/MPl+I4na2cgiMPYZmlF2GQU2j1UGWNyUm9s9lUDbEp
	Vj3HQ8FWO9bqgo5veiC12Is2F87CmeJzj/RYSyEGr5Sq8HC7cx9mLHoEHKP97SApjSKUPA1cdkW
	GyJIesA99hWfWIpjSgckLVWNKPzU2ugs=
X-Received: by 2002:a2e:8593:0:b0:386:fc3d:e42e with SMTP id
 38308e7fff4ca-389a5c45cf9mr29961451fa.41.1771922912741; Tue, 24 Feb 2026
 00:48:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216160946.2977985-1-wens@kernel.org> <CAD++jLn6vphCXZpK3xKa-DcNwaXF-A2ZpDyFBboZSdXtUiGekw@mail.gmail.com>
In-Reply-To: <CAD++jLn6vphCXZpK3xKa-DcNwaXF-A2ZpDyFBboZSdXtUiGekw@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Feb 2026 16:48:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v66GN=UuX+-YDPByQQqYOjzi7cBi-7xA8Dyg_QLqqyueeQ@mail.gmail.com>
X-Gm-Features: AaiRm50zQM5-YqlIe0QYE5rJvFuQ7BPplM1zTgPt55qkPUD18Dv4CxcuzPCa7n8
Message-ID: <CAGb2v66GN=UuX+-YDPByQQqYOjzi7cBi-7xA8Dyg_QLqqyueeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Linus Walleij <linusw@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, James Hilliard <james.hilliard1@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,sholland.org,gmail.com,arm.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-32107-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 98AB818400F
X-Rspamd-Action: no action

Hi Linus,

On Tue, Feb 24, 2026 at 4:43=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Mon, Feb 16, 2026 at 5:09=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
>
> > After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> > gpio_chip::get_direction()"), a warning will be printed if the
> > gpio driver does not implement this callback.
> >
> > Implement it for the sunxi driver. This is simply a matter of reading
> > out the mux value from the registers, then checking if it is one of
> > the GPIO functions and which direction it is.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>
> Patch applied for fixes since everyone likes this patch and
> everyone is unhappy with the warning.

I was about to send v2 with an updated commit message but didn't get around
to sending it out. Would you consider dropping this one?

Sorry about the delay.


ChenYu

