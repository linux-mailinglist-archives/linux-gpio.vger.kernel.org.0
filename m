Return-Path: <linux-gpio+bounces-34752-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMvxFjyu1GnNwQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34752-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:11:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA1F3AAAF4
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02C61307923B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 07:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F8D3921E7;
	Tue,  7 Apr 2026 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lg3+MFyn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD4F38F248
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545786; cv=none; b=kyHMpQu33hANa3rVLFd3UUbOtTcCDSdeH/YnYad+VskZXqV1RxyO6Q/8yjs+lKUcJGYok8gmB4Snm0p5UisgmPr0vrTOcCenyldg0iBJN0vepaKdiv/cx3icCt4GqcaJq+r4q4Snb5F63jBRJlezfAS5LQ6JZPK8oe3Uc9uPCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545786; c=relaxed/simple;
	bh=KC/jj6GmhMHDUzRtlH3EgwHDlxInZpWR93VMFPpSvO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lk46+KfuaASTY44KeuwIbjuc8s1C/IyVbSAXPQpw13rDlIcQrNDwfAONNai2QNxlK+S0NiR6fideiHQOUGJNUmev+8ug2lqsx8cuoSyNEji7kdxZE7bYQ00zA/GBF9raxc00nFSwzAUBylFpicJM9bd34yx7y5dsYrRz89cC2ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lg3+MFyn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1628C2BCB5
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545785;
	bh=KC/jj6GmhMHDUzRtlH3EgwHDlxInZpWR93VMFPpSvO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lg3+MFynZZDfGOAdcXK5csUuSME6DXXC2MFxNvAOHdoXnkpb4sCdWpygnucSj9v1m
	 95UFzrmtIoL/cY3EQ5MbSFZAR5Fb2zHLH5E2xcV1SfEIllG4HLZJ+jDvEJZG4VS73M
	 /tloYF7hTklShsjtd2WMxecRcFfyyLlFISH0sP9Bv3MV2PvGMIfemhb7LZF26B8ZYV
	 BVeRbXceej5LrHISpis04/2N/bLNcGtjE6vGSA/xYpa8Mw2mVzvRV3g7OOP3vHiSqr
	 m8SJo43kSOF5F6ZwQOUf0vlBiX80pFNSsfK3eE2SCsqD2Z4vHIQLDRp1fOlBAOaFsV
	 zHgQzrtSI1N/g==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79495b1aaa7so43768067b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 00:09:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUF9oM9jZW88TEaWLgfuYmoYpi8lXbcz1IOrXqrsCOHZNH8LA/27+MVwHLkKRwGuBcPZtVtoCQKydG8@vger.kernel.org
X-Gm-Message-State: AOJu0YweAi5E6hZX3CiNGT6tNpZ8GI4Horb421MuhDGYyR5Q0i1aYAzk
	wDzrEAe31FMRVkd5FaBl5k9tepggcwxRMJBOhGgK7JBw/D8MD8hjpYvnvoyJY3wPZzinmnOE3vW
	cM5AVLeEQX5zZlBPTLP+uD8DxC4J9SKg=
X-Received: by 2002:a05:690c:38a:b0:79a:7cff:7b81 with SMTP id
 00721157ae682-7a4d556cdf1mr162249447b3.27.1775545785139; Tue, 07 Apr 2026
 00:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 09:09:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKRFwdZOVdjX4wPmU_YvHw-MNjbbe09-GPaxHYDNav8Q@mail.gmail.com>
X-Gm-Features: AQROBzCRHOHR9JFWyk6j7oerUzw_hLzyX-ZP_Z0zJ8yhgH3qIO3DjaI4Yz45Jn0
Message-ID: <CAD++jLnKRFwdZOVdjX4wPmU_YvHw-MNjbbe09-GPaxHYDNav8Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: convert to dynamic GPIO base allocation
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, ye.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34752-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDA1F3AAAF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 11:53=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.co=
m> wrote:

> This driver is used on device tree based platform. Use dynamic
> GPIO numberspace base to suppress the warning:
>
> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
> gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
> gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
> gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
> gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

(I personally think we should be progressive with these changes,
Bartosz may be more careful.)

> -       gc->base =3D bank->pin_base;
> +       gc->base =3D -1;

Can we remove the whole ->pin_base next kernel cycle if this all
goes well?

Yours,
Linus Walleij

