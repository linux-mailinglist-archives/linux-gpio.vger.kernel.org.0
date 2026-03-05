Return-Path: <linux-gpio+bounces-32570-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGtMDQ96qWl77wAAu9opvQ
	(envelope-from <linux-gpio+bounces-32570-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:41:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A74C211DBF
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA6AD3007AE3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 12:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CF5331A7A;
	Thu,  5 Mar 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVsETJRq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982201B4257
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714294; cv=none; b=A9zf+n+wG1YUD7O6Y1zmBA4fiP8zQwIbo+1yErS9DnlfXalWmIPblZ+sL2MlM01h0VFCr7jcpjY1seK7jwMumTnLkIReE3SfVfbblKLe9LDVhSviznQDaH0N+pNDlbtWK4TYtTpTW+xd+b7x8ZcQrYxwyejZJ9fkXaIKFUngUnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714294; c=relaxed/simple;
	bh=YILoVLGY0d9l3Ewjdm2YR4mjOuK9yDzK8JSKEmIkd4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gn7StKZaBB4BLBSXZZMzzVe2/Uy7goSuK5ZeFdFex63Gb8N/aQT1zlU2D/3c5yjb3KYnn0AWOGWS8xxyI7vxc/pwESgt4DTy+XJ5AClyysdlvYlQqL7wV3Br3HzJszCLOgnHhdGVG1aBl2yonTLg0ezChdDygJErbvs/Fk2Cfks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVsETJRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7A9C2BC87
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714294;
	bh=YILoVLGY0d9l3Ewjdm2YR4mjOuK9yDzK8JSKEmIkd4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QVsETJRqUEAX3a6k8juQSbsFP0DOYCKXVQBpbwuL/78dtGIpCLZFUZ66N5gPU7Ukc
	 ILrdl/V1llkc5/qasUBrZF8gwghVKp6+/qAxyyA2LDgB/+mZZX6FnUkWfSkGgNGVVC
	 Ci4ZotRVd1up2JzaVo4z8oMI5ghIF+8ZeJFD4rFXgO1vCaBLG4QkAouzjha/ZNuC+U
	 uX/w1nQ7ofonYYCBXINppwHfFCTawG0WOl4lp/Q9az7abHNZFZmG3kJXuXr7eLzEI+
	 tLJrLRqwuAOzw7Fn/7GTaWaZTkgDwhIsLG7pk9WZ/mud/Pu+WoAoPwQ6IQg1rjr/ws
	 TyTe2jp/sdakw==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64c9a6d68e5so6000237d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 04:38:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDcklHTNw8CX/RMdx+az+sCzY9hrGPf6E1Rp718HIm7yr0XSpAi0XFlY3t48uZuEdX/IdzwDIz2IE+@vger.kernel.org
X-Gm-Message-State: AOJu0YxSPkXm3/9bA3BnyTNqRilQCx+mzeDNJttLkw1nm3blJrRran0g
	fQxZoUiwMDtCVupqJHj35LECzdViLaj+r/LbvQpfcGBewEVpz4M5Q8uoCZXyyEx8k8QyaOAO5Vn
	j9ds/aHxb9p95gUtCDiO2/RyHI5hVgto=
X-Received: by 2002:a05:690e:68e:b0:64c:f90c:740b with SMTP id
 956f58d0204a3-64cf9b340e3mr3076580d50.18.1772714293847; Thu, 05 Mar 2026
 04:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1777BBA64A3D0F97+20260304105215.536399-1-xujialu@vimux.org>
 <20260304110740.548318-1-xujialu@vimux.org> <DCCC09EC17B995A0+20260304110740.548318-3-xujialu@vimux.org>
In-Reply-To: <DCCC09EC17B995A0+20260304110740.548318-3-xujialu@vimux.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:38:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLk3UzQKjseZz0QYFzkEtaaw9vBt8i4ggK6jNcPknVB=4A@mail.gmail.com>
X-Gm-Features: AaiRm53Sk7T0dxpHUlhWSWz_INlHqX-TLeUD2EEu0GRv3LsgwpcNpiCR0aC0eas
Message-ID: <CAD++jLk3UzQKjseZz0QYFzkEtaaw9vBt8i4ggK6jNcPknVB=4A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>
To: Jialu Xu <xujialu@vimux.org>
Cc: brgl@kernel.org, kees@kernel.org, krzk@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3A74C211DBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32570-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vimux.org:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 12:08=E2=80=AFPM Jialu Xu <xujialu@vimux.org> wrote:

> All in-tree consumers have been converted to the descriptor-based API.
> Remove the deprecated of_get_named_gpio() helper and delete the
> <linux/of_gpio.h> header.

As mentioned, remove it from MAINTAINERS as well,
also add your Signed-off-by.

With those changes:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

