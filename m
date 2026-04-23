Return-Path: <linux-gpio+bounces-35428-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBYiF3+O6mnK0gIAu9opvQ
	(envelope-from <linux-gpio+bounces-35428-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 23:26:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1970457D47
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 23:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 045F33013789
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 21:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4943BE624;
	Thu, 23 Apr 2026 21:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHRlZOeK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AA8392C2C
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 21:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776979574; cv=none; b=EJeWdcmpapz4YzDjqLDmme3vid7Cm5WdyQC22uxWNGQt9T6H2oGcFhO14uCG6R5uhz7VVwTailAIP9YfqzKnRWBve/z2yXBIOt0sVS2zimq0AZYf6KbzCOuNr5dUYdSO+uNkN9+h39TDret9Hr9en+rzzy8cH7xFCLdgDgp6MEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776979574; c=relaxed/simple;
	bh=QoQhslnr2VDDv4dJKxyzU8pClbacRNGZ6y9c0nTvw58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N97sKbt8DrYvlVugiPKpsd26JUJOrSs/wqCAkQQ1iD7oJE2Pw/FxpI5ZNx6ddmY9HfAODfUe8BlMdA3SZdn7B7ZEdN29/1EcwO+NtLwTjeBOIwCERIuTpCRWSvoGVjL8WkJj2dvJp62pClyoXW3iLDD1SUt3UeFSxB0T7KQoya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHRlZOeK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49521C2BCC7
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 21:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776979574;
	bh=QoQhslnr2VDDv4dJKxyzU8pClbacRNGZ6y9c0nTvw58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hHRlZOeKFAljiXXH6X7AXE1TD3AOWdINseVHnhCIz6ZsdBOPUuwYkdaJOtmY8IHd3
	 pYOBhsNYdUuGVUr2mFrZCP/cYpGZfMBPkBpmN6wpp/8ontKUCQvhmpT3eHYSRfGuvi
	 uBdf5qzzKaPpsXsV/VpBeFtEhzQPX3E0bAH/sktULPDuwDR3keHhX1uaQ/6J6h2tYp
	 9QiiOy3eAUW3/y+cl5nJH/Fg9tzs4O/H2X/UZs3XaDZ8QHX6VsSq0hOACHuiCm0e0u
	 2b8VGFvYISf03NYqQpVdFMfB7PKADurExOMoWaP962uCLDDLBV68MJyuVh0FTzmF+h
	 DJbepJSK0sksQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a4113ab355so7540605e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 14:26:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9IH4sRg4gqWkTBz5ZIwb6XNz2/6e/qOmkLfETIA85n1J93VOU+4LuAdFUCag+9U6TVK0/E29eENT5s@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLfCX+5GyheRryM+jLHEJK2YjxoAWOry0dMMd0XCNurLfCPg9
	UAFmLbrdyJB/f9pVr9k6FSstG7eroV7bOQMO4Szy7YloxcuNLGGO/1HpKqrXvJFPyUIXYR223WL
	ofwNHdnLY2kDAiM0jJMuEGnO2JrI4SYA=
X-Received: by 2002:a05:6512:1302:b0:5a3:fe60:471c with SMTP id
 2adb3069b0e04-5a4172cb33amr10098495e87.16.1776979572944; Thu, 23 Apr 2026
 14:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com> <20260413-waveshare-dsi-touch-v3-7-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-7-3aeb53022c32@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Apr 2026 23:26:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLkRf0ehBr0CpCALJHL58gUw4954XzjxHOu8c7n7=b-bUQ@mail.gmail.com>
X-Gm-Features: AQROBzBtnhd6trpGrfIHMX-D0f7VMPVcAX7SFq928axT4eaRMtmMnoYhsxJIvXU
Message-ID: <CAD++jLkRf0ehBr0CpCALJHL58gUw4954XzjxHOu8c7n7=b-bUQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/21] drm/panel: himax-hx83102: support Waveshare
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
	Bartosz Golaszewski <brgl@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35428-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B1970457D47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 4:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Add support for the Waveshare 12.3" DSI TOUCH-A panel. According to the
> vendor driver, it uses different mode_flags, so let the panel
> descriptions override driver-wide defaults.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

