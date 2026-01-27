Return-Path: <linux-gpio+bounces-31145-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ECQAeKMeGmqqwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31145-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:01:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA0D92522
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE55D3013EF0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E57A2E285C;
	Tue, 27 Jan 2026 10:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCJWOChF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415FF274B48
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 10:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508058; cv=none; b=GiUo3tCqybXYCqCraJRjca96GAH9uO0xWeQmN/2mmIYQDC8irOMS6feOpd5LLkAEXiGCeoaj6DI/Z84FEO6WjW7NwEXeOA/w2dO+P3sTqU0jNzUfzKNpvVUhV7DOmG+ME9m5Z2mvqHDmtyRf74H875KB8sOGPOcXGluOJY3WAKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508058; c=relaxed/simple;
	bh=60f8Q6hm2bOtEWad3lE65lnTlI/fT6nozEWfs0V1vWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IkY2x73Rfr7mGOK1DCQhtJo98psWs/KWJN0VrM2P5Cxuy8G1X1i3g1uvAxMUZJy73wrjJsvTeYP0hPVw4hr0G0xvzgir4nDpc2K+JFCvKXxQZrD23G4GVMKGZM2KzllzVa48Ka2att5uDlzzFDswIkrA0uAv3wp3V15VnfW/x34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCJWOChF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AACC19425
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508057;
	bh=60f8Q6hm2bOtEWad3lE65lnTlI/fT6nozEWfs0V1vWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mCJWOChF9mdeXXM4bLVAnaHNJk85/0YmzljlxbEUftUowD64R9gPmonHLmyv+dkpD
	 r2YSya9PMbR92ka9hNjsbZYSQwSmvACJ0bGIT7Mw2401BbjBWAFAb+VVtg6aovdBaY
	 /pp5t/rY/gnVEXWpvu/cP5ModZdUp9ifJOyGGDDPP3X7amlhT9Yal2I9ZLVN/a9+eX
	 LJqvJWSmrkgCJ9eKOA7fYU+SjLNhRJ0iEwugRvWx1IR6HcBiMjN4qalz6KB2iGMRrb
	 8Zt9kG9mt8pCxQkjdy4CFTixQ9Yfp+v0WbQD/L4LrPOQJ8729s7grphO4D3APTAkER
	 LyTX6ZKMBhTpQ==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64970870c0dso2112806d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 02:00:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXk0skHAbak3w7OOSXFey9KcsAy9YuyCdMrEowbuj0RpOEdGiJUkpUFW+MJnLYSi8jvWz0IGaY6nO0L@vger.kernel.org
X-Gm-Message-State: AOJu0YzV42w8bbRtYg4NV9v/0Vt/NJo6vIJgipI+dMN9F7U/aISXpd76
	jQHCrgQdi1whouYde4nCs5CRd6q55n/k/5A21qePhridOy/cHwn1cKhR/9ZCu/EXuVRbdIZJRd0
	lPq8L6ZH6gtMVJXzZ+4XIzjQ1A4AfEj0=
X-Received: by 2002:a05:690e:134f:b0:63c:f01e:f8a with SMTP id
 956f58d0204a3-6498fc46aa4mr569506d50.46.1769508057244; Tue, 27 Jan 2026
 02:00:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bddc0469f25843ca5ae0cf578ab3671435ae98a7.1769429546.git.robin.murphy@arm.com>
 <CAMRc=MfQCrhgv7DcWrr3TWe8DtpZSRrkxb5KDHsGq1jPjUAHww@mail.gmail.com>
In-Reply-To: <CAMRc=MfQCrhgv7DcWrr3TWe8DtpZSRrkxb5KDHsGq1jPjUAHww@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 11:00:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLk_ATHWwt_e+KN1+2sLYxqB4n-mdrbdxUHpHvnryeF+fg@mail.gmail.com>
X-Gm-Features: AZwV_Qio_o-Mq2iM8scY0YLmPrOEH2sBCtjt6jzEPfeEfBoz7oFz9Fw0tU17ghY
Message-ID: <CAD++jLk_ATHWwt_e+KN1+2sLYxqB4n-mdrbdxUHpHvnryeF+fg@mail.gmail.com>
Subject: Re: [PATCH] gpio/rockchip: Stop calling pinctrl for set_direction
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, heiko@sntech.de, sebastian.reichel@collabora.com, 
	m.szyprowski@samsung.com, linux-rockchip@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-31145-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email,mail.gmail.com:mid,sntech.de:email]
X-Rspamd-Queue-Id: 6DA0D92522
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 2:48=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Mon, Jan 26, 2026 at 1:12=E2=80=AFPM Robin Murphy <robin.murphy@arm.co=
m> wrote:
> >
> > Marking the whole controller as sleeping due to the pinctrl calls in th=
e
> > .direction_{input,output} callbacks has the unfortunate side effect tha=
t
> > legitimate invocations of .get and .set, which cannot themselves sleep,
> > in atomic context now spew WARN()s from gpiolib.
> >
> > However, as Heiko points out, the driver doing this is a bit silly to
> > begin with, as the pinctrl .gpio_set_direction hook doesn't even care
> > about the direction, the hook is only used to claim the mux. And sure
> > enough, the .gpio_request_enable hook exists to serve this very purpose=
,
> > so switch to that and remove the problematic business entirely.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleep=
ing")
> > Suggested-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
>
> Linus,
>
> With your Ack I can queue this for v6.19-rc8.

Late to the show :)

Heiko's ACK is more than enough for this driver, he knows
Rockchip way better than me.

Yours,
Linus Walleij

