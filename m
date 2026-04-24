Return-Path: <linux-gpio+bounces-35455-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIBsL8gY62kGIgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35455-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:16:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B2E45A9CB
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1BFC30103BA
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 07:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4289935C19D;
	Fri, 24 Apr 2026 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFQTWb8J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054DA244687
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014976; cv=none; b=BsRS1H+Moog/+PZYjPvWJoMe6BuCUEFJMXgr77Q9dHzcIE9QMNc+3SA5SfF/nAKNkWVhdBia5MmZn+UAqvCoOpiOZWOISOv2IgboLvZSj5Q7rWSvfkjKHF1t/G9ag5gc3FJANM4lmYW1irhbuPVycU17COH0H8bLgoXUlOG54eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014976; c=relaxed/simple;
	bh=gP7PpH9H3xfpp8xArzPnS5sesJV/MRdRy2nCufsQQ6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j56j2Xubc3HGB8W+pf8Dm9pcPHdg72okFqikKf/FfQWnw1jkIClrUFwy1PTclXxVZnOGx+2NmOjvH+CtxKyQT2ouNTxOtbGi7RVgApv3jqhPE7hrraxFB3LWxniXHdi5ndQdhoHzABqbZ7EfIKlEb+xa84jlI0+exGzSd9dY9kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFQTWb8J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBFEC2BCB4
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777014975;
	bh=gP7PpH9H3xfpp8xArzPnS5sesJV/MRdRy2nCufsQQ6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sFQTWb8JdI/3SBTH6wfBw7UfUb1M+pKsJHD0Nz+8mX9wKys6cjlgy4yotQoDskPQY
	 /yDJaM48vo81mH0VTr4bZvZQXTiajq4RRkQWygPcA8+KEqjTAKStUQrpWIz8RHUAGb
	 Hj2ULGZN8h2l/0PeSPYSVET8Waj+QSheMwY9TkKH3mZRQcEjRneoCXMfUyyoNMIqt6
	 YP41pH6z7dDlExyywfwp8i9EBLpgmxPSTETfYT9B5vHdiZHLXuc/F7VU8uYA7emel9
	 5uQq+Rex8G3d0AebfpLUGVIqt60bpNq6Rfz+QBBOCOGWhUfBxMcXCCcP7MUCMX+FBJ
	 xILVyB30muDAQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-386b553c70eso61104961fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 00:16:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ++ZdMNoptpAfM8MDA1+M6QhmKNxYdno2Bp0pvN/rS7XhllM8GuVHzA3OrYFMbyHrtbVdU3aYHYlAdo@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBbEaPkMBXb/BAfiUFrqk72d2rsjXri9vUam+YokLvQT1xG6O
	e1A032hS6hTBuCeqs8zHIK69RpvoRzrJxq8ay8VRPcrP5SZiy6ZF7tFxfpDHPgoT7GPGIfF6W5/
	3b5Gb2/5siIhn6pWmqB25DVx1jRGNDik=
X-Received: by 2002:a05:6512:3b2b:b0:5a2:bc5d:c675 with SMTP id
 2adb3069b0e04-5a4172dcd63mr9127108e87.28.1777014974054; Fri, 24 Apr 2026
 00:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413135234.4067548-1-mail@tk154.de>
In-Reply-To: <20260413135234.4067548-1-mail@tk154.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:16:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLnMJ1Kx9Q89E_pOUL8WxX7ow5+WTj1cTghCfwkLwBpzNw@mail.gmail.com>
X-Gm-Features: AQROBzB0ISXJxx-TlRRIcwpMiAbyqyHoiqngvlW2iIbf8XhMG2arLNoLDaFX5eA
Message-ID: <CAD++jLnMJ1Kx9Q89E_pOUL8WxX7ow5+WTj1cTghCfwkLwBpzNw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: ipq4019: mark gpio as a GPIO pin function
To: Til Kaiser <mail@tk154.de>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 55B2E45A9CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35455-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tk154.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 13, 2026 at 3:53=E2=80=AFPM Til Kaiser <mail@tk154.de> wrote:

> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
>
> ipq4019 still describes its gpio function with QCA_PIN_FUNCTION(gpio),
> so it is not treated as a GPIO pin function. As a result, GPIO consumers
> can still conflict with pinctrl states that select the "gpio" function.
>
> Add a QCA_GPIO_PIN_FUNCTION() helper and use it for the ipq4019 gpio
> function, matching how the msm-based qcom drivers handle this.
>
> This allows ipq4019 to keep the GPIO-related pin configuration in DTS
> without tripping over strict pinmux ownership checks.
>
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Til Kaiser <mail@tk154.de>

Patch applied for fixes!

Yours,
Linus Walleij

