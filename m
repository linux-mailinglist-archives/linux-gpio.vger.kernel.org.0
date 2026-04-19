Return-Path: <linux-gpio+bounces-35236-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNbWAu445WmcfgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35236-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 22:19:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 389C042570C
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 22:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B67E30075C0
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2026 20:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD4230BBBC;
	Sun, 19 Apr 2026 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdqXyam4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72F2FF67A
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776629924; cv=none; b=KswAG/snH6snLqQSVpYK09u1mh5MK3lajVa+hTYudsf0Re+WnfaT7TdM6BnPvEIpufBXMB84vONYZQbvxkuZGW0Bct/dZMJxQ0aUHJ251tfm2d8A/gXGUzhwHJlbrqWi5D8uXdQscubIPsiMjeSskaQ1VAaFKLQlcwutDQdor8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776629924; c=relaxed/simple;
	bh=OLw+eRHqgrO4zkt7f8sg4S1N4ShOJ80xQG0TYWK7Fzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdHEqnBlkm7sfMm/Ih01X2EImrN4HAc2OwT2EbyM1/rhHBX78eNOwaoXcPVATpFgj7OTKEd17MtQl3cor2JKWwlj69tS40fcRISS3wM/NCS0xjNbSrcMumPn37sNy6Ry39QgXoaW0CiL6fzSu9CF0al8prb+ws5FbwEEbMv566M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdqXyam4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E7FC4AF0F
	for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776629924;
	bh=OLw+eRHqgrO4zkt7f8sg4S1N4ShOJ80xQG0TYWK7Fzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bdqXyam4T54s0JFglAzKfobk/dK1aCbxutS+oHayTXXfHKcPGoDxQSMfQ2+tnWYos
	 yR7nqQ7s0ulRQyYnm5pURSgZqYKFsE560VmQSLNFXuaeT1M7TfmsgMVgf8/0GYmyZp
	 k5DDFFuiH5lFoR4vtuFe34Dt/vEmLsGyGsibDClZH3AFBmbZaEAkZbn2Hfym2NPHTZ
	 N6FZPe025h7lf8IKuJwgm+DkE1X1JiCaVvGnC4OWPVanXkrBfraJtBbGQ0PamLUhfO
	 SmzgbIcDxVRq86SrH/U9LSiiAboftYMCNUC2B/neKQxfAvX1GiOX35ElYtpxWSVOQ3
	 +ayrGo2jnsu1A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dcdf60427so2049855e87.3
        for <linux-gpio@vger.kernel.org>; Sun, 19 Apr 2026 13:18:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9MrWJ86FY2Zqs85JcXYULInApNvVCn/Qct/f5RibP7zMxVZ/Kur/eywHyFYRMRhX5KIfP7ycs78iAN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Pn4L+/5QfeKeTyHT91QlIDmf+nwowI32P45kovuQN5zGiYOu
	2UEjJ7cvEnLFf7Q8L9HW/Z8TV+iWF49rG+Bbft3TaXVyaRMVtD0CA5z8i4LcmvdaU2SdmpRVNzn
	dyttHzvMW96iGMbdSrfcT5GgXSaVaLC4=
X-Received: by 2002:a05:6512:6d0:b0:5a4:1b8:1a92 with SMTP id
 2adb3069b0e04-5a4172e7c28mr3289204e87.21.1776629922903; Sun, 19 Apr 2026
 13:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com> <20260411-waveshare-dsi-touch-v2-7-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-7-75cdbeac5156@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 22:18:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkfBhdhhYoPwGEt4XghNGuLFaMEHsKPbjEoFGZv_JJiKg@mail.gmail.com>
X-Gm-Features: AQROBzB3V9CUelEnoDXtHgFP9-TRM15zDUUV4XVkXbwM8iX4PWyJW-UeLgVME0U
Message-ID: <CAD++jLkfBhdhhYoPwGEt4XghNGuLFaMEHsKPbjEoFGZv_JJiKg@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] drm/panel: himax-hx83102: support Waveshare
 12.3" DSI panel
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
	linux-gpio@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-35236-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 389C042570C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 2:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add support for the Waveshare 12.3" DSI TOUCH-A panel. According to the
> vendor driver, it uses different mode_flags, so let the panel
> descriptions override driver-wide defaults.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

