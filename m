Return-Path: <linux-gpio+bounces-35232-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLESNyU45WmcfgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35232-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 22:16:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA542568B
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 22:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7EEE301F5E0
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 20:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90902308F26;
	Sun, 19 Apr 2026 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNanYgSP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3803F26E706
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776629774; cv=none; b=rVNdErX+ELHqZ7nmiBLz/puqKyrDtP0Ax68hciSQZbgF8AnmtSAEmcY8guJBoqvat0AUYjTWq1USaEV4dx9ET10jZUMUFPXTD/3YISaRBmzYL423lC4Nw5C8VPKixCJ/UKyTiFFqL7NHhj3ayV/Ijh9T07PAT/YtwtUqKtIoE24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776629774; c=relaxed/simple;
	bh=GDhTvkiJqhINQX5MFA+xMV3KNOf+hKPswGRtUCHk2Eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qv74gky6NaiRVFcVbkJQx+JB3HkWYMTdwcrbmpQwZ7NgeTmSUpT00fHbSx+FiQ2BeDGO/SjW2jyR4MjIPKRDAVICsoBKY+97kvjQ3FcpGGIBla8U4Symc5uqqrT4QUqKtc2sROlHnheOiUwWZi8cQWD7h13mH7fvrJ0WiVdsfgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNanYgSP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A74C4AF0C
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776629774;
	bh=GDhTvkiJqhINQX5MFA+xMV3KNOf+hKPswGRtUCHk2Eo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UNanYgSPKXhtuQvcTiknRwKiDS9Z3TFB91umg6u66Ih3mNWwJy8GNtsKysjS69wpy
	 bB4RyP7aCcX6KD6SQJfMzpwH6l1da88TRB6lnaBpqbqwU/dhlYxUj6jBpY8oJ1VK3t
	 +d269WHIqdURtvLMz12R0wPmf9qMtdCKSOLBjxHzWumRrnZDedhu6ciJpSMBsq2lTI
	 tTizeQwPIHoqUxKWULSBn2geZhhZs36o6weUgFJb45CIdBmgRiWcTmnMuOa+rmMWL2
	 eo3rGJsgEpATg7xGIccjKDcwh44zwd6c6vZcYKeFT9Rdb3B/yVF12H8Ws2/vOFuQXo
	 WZhm4V1v+AdTg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a1307438ddso2232339e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 13:16:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+DHh0ZSHME+PkhpRuiL+qKzE1qSpssUpddyVHs8aeIiU7052nuzXkR0Lto3rl1GOi5p93je70SH7i9@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHPuhHwNwm4L0YkorVctMgHtgxSrKM9R95u2HL8V9Tjq6b14H
	5ZdK6a8q3Mip+RbVa5n+qPKu4TvWyah6TTe97U26KiKGSf+Pl4vPPcPDpQNMVmFc671KkfaVjwe
	UbyLhEsEZJjMiaUQhnzqvRAlFC2pwEp0=
X-Received: by 2002:a05:6512:61a2:b0:5a3:ffdc:1d22 with SMTP id
 2adb3069b0e04-5a4172e4ffamr3383211e87.36.1776629772615; Sun, 19 Apr 2026
 13:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com> <20260411-waveshare-dsi-touch-v2-14-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-14-75cdbeac5156@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 22:16:01 +0200
X-Gmail-Original-Message-ID: <CAD++jL=iJmYKB2psb0A=RUAFZhKtc6KQmsB9HED1-LQAAFbYmA@mail.gmail.com>
X-Gm-Features: AQROBzDjOWLTCpwVHd-bfYDfUqw6vHHRtJrX45Wrd5GY8ZZuzBfZra5z61yRT00
Message-ID: <CAD++jL=iJmYKB2psb0A=RUAFZhKtc6KQmsB9HED1-LQAAFbYmA@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 round DSI panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jagan Teki <jagan@edgeble.ai>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35232-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org,arduino.cc];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arduino.cc:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 7FFA542568B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 2:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add configuration for Waveshare 3.4" and 4.0" round DSI panels using
> JD9365 controller.
>
> Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

