Return-Path: <linux-gpio+bounces-30804-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJHTGvQ/cGnXXAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30804-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 03:54:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F80450125
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 03:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 28A57720E5F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 13:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BC0410D0A;
	Tue, 20 Jan 2026 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngKGSC5x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9FE344025
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916590; cv=pass; b=EyeDM8cLRzXKPYf4UDUA24jKs+qb8KxPrVZiQzKNsKI+JZ9inBMuK8Z8kg3cx9Xwm2Y4vsfQD5iY4xd+A3wUV9YopLhfEa/Rd11MI3MMNhU39TXhzo4sVhj3IjCAt25OcMyIFr9X4Uq6hMrft8v0VB1H/HyQgGsEd9XcYNP8eis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916590; c=relaxed/simple;
	bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qa9+QIAEhtf7cbHczEJ6f1RNgGeuxrfBfRtzne8cwH6lpopLQvQC8Mq9gaked8Wm46oJk+//EK57FSW7b6fszroAixKbEvNwIsXRRvp1WDCG+zgGS3ED+n70sBOMA6Ab/ZkXMDlyXr1ZEt8uZF5TfaHG+vGKHsGES+OqCtpXFhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngKGSC5x; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-123320591a4so5358169c88.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 05:43:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768916588; cv=none;
        d=google.com; s=arc-20240605;
        b=WaXfYjEGnkFgfnJPoNmdxR8TuAE1Ue9FIrRMyggf5JPS91c6ZW3wBGpQ3fcEhdQy7A
         nxRS0YWALX4l10I8dvnf7xPNjfW9PHDJEujzH0Cl6rjKT7sGArnFmZ2SOZoKr9OkHcu6
         9Qa5n3t9xvO2oonaFzYv3cYHbe3bGB0gz2OG38eXHtpw0Xl7XVELHT0i65JMwkC7K/jC
         m/duUJfi7VXGL5/NF68LfhzvUSrahOmy0NJIik6/Y34QlWXG03cNeWDGRz9dkskrVWHP
         pte8oko4nki7TELvBvMsSJvy+Dy6HxNkG2MvLPFYJrO/DnDPMXUuqXSLVdOk1xO+LJsY
         xvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
        fh=2JvV5hIxJNcWFn2fMYVrxxngAN0SsGWEfbgC7/jE760=;
        b=bgIf7yaCZ863WDxDZT2/fFE3OwphwlB2EHPQkKKtKQrGqdSF+X+d3Cy3rJf9j0sxH/
         f4mMyPqNsnpSnXvWWWbETScR3pw2xrpa54ez6qTqpMu1IS+afEJKw2fp7qCmcV3Aeqgs
         iugB+VTVHzH1FGWNPafGNugZYXBS9W05WrNTiyNYD60wtR2hdp02LFMRgsx+5QpDSmkD
         BcozqAnHnhmOSRM8qd3qH34/Cc8TJooqb4o5l630fzi36p1HC3w8/QHexH8N9+yPsuUG
         2OiYZpGD6jPw6XpueWHoKcAKmypirJ3ZrHm+0Rxgrk9pKHbgewUUPHr0ixGn0sOtruSP
         2sTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768916588; x=1769521388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
        b=ngKGSC5xMF8tRwT2TwE0rPr9Lgn0cmAkq0DyDfJEAlObFu3edAjs+bcOn7C6C2f4NN
         DgfVfn7aeLCsSWjEIm5Dlg6XPhzVgs+qcsW5SjO78SfsdsBVondNdOaM44EYmQ28v9Z3
         bw4XULFKtdi81TxrMX0s4+W5i6oisJkNQHnHgZS2Bbg03fg7iXTaXO3dKp+V8gA9nr2h
         yiiwXKNgDLkEpJdMGrzWIR6b2y3+8X6ZjBbvDNwWrSYFZ0FK3TtSuvxXzsen6JHu7KGc
         aDJzE5v4JHmXAsjl536ADCT0oHQ65D0hf0gCgeiwM3YrFE2HMaOWFRtM3/QtSsKE9Auu
         N/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916588; x=1769521388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
        b=QkFGV/wD1LvpNuX5+ZsrLRDp6mnU+3ffvSGIu/wXouLA89TpLPZcjC5FqVbSGD8XQ7
         dF+SXJJv1kfw8RS5wRqXu/0v1SOojOmw0qmEb5rANMYn6cQx4eEXfrawA4bMzuszwco7
         hUJKVMuuuSnTntzi3e9h20tRdXfQ1BBU7oDwTRM8StSNzM1bqiuIcbcWhZwh+PFCVCcw
         xGlzq0dPz+u9mrAP3uBF/3Eno+Z0DzZvZWuVWtAHLMOFfno/Avw9YoiFg9ONQjPPADki
         YIQXk7xYkdldWSFq0FdFRTP2bllnshMyt68ODadzVwKkV2EkGayXNke3IXd/hMzE3wCb
         mgFw==
X-Forwarded-Encrypted: i=1; AJvYcCXKV1ajDxeVXt+mAyAJtqXznqLw3DD6fDRs4nVmEWasgu4hkX4hMGWrREVe/Vgf+VpM70eo+/g53DzQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy85DjKsCcSECdMasfCdCUc204QSPx2GQy6NquJ6zRoIWrst2aK
	/MJ/Zc4t/DdkYaiMuTxxzWk9a8C+RuxOvRZjwr92vH8LOoex4zsHmq0NnpGXluaFdgwkoQQhJxj
	6SGHHX5eoRubKSIvSB9LK5+xl78jHjLA=
X-Gm-Gg: AY/fxX5QutSfCYBgZWKeMhyLb2jvQsajXRY2eldwTgzGInycQYcS2B2W5Vu2ujdRscG
	JfpiJTnNWkqkTN29r8HzOaHjEbbESY+IGMIcMyUABFQtZ2ow51RSV+01Xdg2uIXPXlFm8NTyuCg
	Hste2+LEPT93fYDtqJdjB4U5Y8cUsf0WeHo++zaeklmuHD8HE/tl+LwR18V7FJamSncyoqAn2eN
	S7kidE9hrHak9+4gXtGYj9+jHDnILYuE0JgHAqADgP4R2erecr9g3mJ1/hYoJcy+DH3P9aKbM/d
	zoOr58Orx8Z/lG2pBk6l4QyW1Jr+nbUHkNjUFkNjBYdZid2pvHEqoIPxGx0j8Efe6B42r+gvU1N
	A7p79ViNrxA==
X-Received: by 2002:a05:7022:6b8c:b0:119:e56c:18a6 with SMTP id
 a92af1059eb24-1244a7257a4mr10880097c88.14.1768916586232; Tue, 20 Jan 2026
 05:43:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-11-khristineandreea.barbulescu@oss.nxp.com> <CAMRc=McD0cRxtb3RCzzYPewFisto=4OjvA4gjaTcOk8ghTw_qA@mail.gmail.com>
In-Reply-To: <CAMRc=McD0cRxtb3RCzzYPewFisto=4OjvA4gjaTcOk8ghTw_qA@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 20 Jan 2026 15:45:46 +0200
X-Gm-Features: AZwV_QiPrjYIgkrWuZvZ77hO6EmYEBB8e53YvqXAvD3NoIb32l_6NmOignEguN0
Message-ID: <CAEnQRZBNKBpwhO2Pr9Gb4cPPBwXf0bMYRuQzshCMJgOkOJEKVg@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] pinctrl: s32cc: set num_custom_params to 0
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30804-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[oss.nxp.com,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,pengutronix.de,linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielbaluta@gmail.com,linux-gpio@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,nxp.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0F80450125
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 2:26=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 20 Jan 2026 12:59:22 +0100, Khristine Andreea Barbulescu
> <khristineandreea.barbulescu@oss.nxp.com> said:
> > From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> >
> > The `num_custom_params` was not set to 0 and the pinctrl_desc structure
> > was not initialized with 0. This would result in errors when parsing
> > pinconf properties from the device tree.
> >
>
> Shoudn't this come as first in the series and with a Fixes tag?

Hi Khristine,

The entire series could use a better patch reordering to arrange the
code as follows:

* Bug fixes
* Code refactorization or API changes
* Device tree bindings
* Driver implementation
* DTS changes

