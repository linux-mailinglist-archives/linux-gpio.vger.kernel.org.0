Return-Path: <linux-gpio+bounces-34937-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCfuC8Rx12maOAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34937-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 11:30:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF163C8821
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 11:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48601303EC04
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 09:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F99F313267;
	Thu,  9 Apr 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+veXf/D";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k1iRMmkF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9750B3B19A6
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726449; cv=none; b=IpPAK2EwD+5QRbVgzHnTDay3rqdZPOoYAPYY9YvZkPJjGyUHh20dCqufB0Jm2daKmcBsHRq7MiDEqHB2YaS9re0yzzFnIBzcHWC0tERCQANmpVq8Ave9RdcmyrPTVS7JJ+8JKLOCFVbUt08Udr60dg+8IcZKuvM7MbUfyQTSf6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726449; c=relaxed/simple;
	bh=Ap3/GSo5+I4TSHRW2SgDcYn5NyH9m4Gkcz3TgAL8Gtk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jgfPbyLGNH03xc2yUqBsLi1jGvZOnLMtEL1LWGEgYyz42aQI0SUTR8tlNuxMX9YaIGr8i+CLEKPHO69//GmzL9rBvuClzpaVLJCg0/CslJqegXzkylMnpn4rltiQQSvuA1YtfSOrv40oOag2vw9I+3RliLnAMyM2PVwX9lrX4tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+veXf/D; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k1iRMmkF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775726444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CbQigwl8IDMuLzMPbB7/RspCPqzOVDhQuvXsBUa4ins=;
	b=O+veXf/DWqeTczS0t3bLH105RyV02KiZnzo1Gt+QEBmEnFXQUqtNlGJV/TKGPBk598jKiI
	7QyjH3uG1tCQOtgFXR9JxLmsrccU5UCk+DGnDLbKYQkmO+c/mmYDVWLXqaB8u/EMd1TDSr
	cCCzMFcTFJMNXgSjk/yHtSw1781EDcI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-VTDa6rmKMiCmtefipeeVTQ-1; Thu, 09 Apr 2026 05:20:42 -0400
X-MC-Unique: VTDa6rmKMiCmtefipeeVTQ-1
X-Mimecast-MFC-AGG-ID: VTDa6rmKMiCmtefipeeVTQ_1775726442
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43cfbe041b2so333084f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775726441; x=1776331241; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CbQigwl8IDMuLzMPbB7/RspCPqzOVDhQuvXsBUa4ins=;
        b=k1iRMmkFu2keiLuVyPVlEcxedTnq7sdrXEUSUH910eSJom5oGok6L1Dunh6wYdmCXO
         ElgP6MeUlX74SuDiHXIhaQH7bsvF6tvyjoRMgglfmqwXbqAwwnxe0rMmSmEZauJ9TFbM
         f9Js/oPHOSQ9IJo5Q/leFq8wTNLzZqA0advkJzj7r9801QqNt7GE4l83nsDGAswhc6D2
         bhRJrXLESy3Lflpspn5yDEExf5fZ3RJ2rJGCEq3zJ31geFjKi3CA9PGfyCuTUScSSJcx
         inEAvlJqB8ZkYHzGr/Ah1/YY3EtjOYXJJ5FbbPasD1/5mmg/YTVAtPoZXqYZJgFiLe/K
         GQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726441; x=1776331241;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbQigwl8IDMuLzMPbB7/RspCPqzOVDhQuvXsBUa4ins=;
        b=DQaP+7UVrZe1wmtD6xqGz1n99DcMcKDizZOFiwQyXpvQETIl+WeTTrQWnf6FVu6tuO
         ZHlBBy1EV8ufivWVfDX4K2w102yHSTEs1Gr4hkPL7nL87IXASWlJY5yJES5Iq+5IqD+f
         6YxI/AVra627B4ThhbNjfeRo1j+aisvwpUn8+wqBtJwC8345vh+y/Hl0G0xAHJn8gXY7
         6CQr8qF7i1+oAZmxqe9r9SCiIxKSRMOH83DuBNKA1ZcdYwuYeMkzsn+2joN8FCfjXv2L
         Pa1bbV44GQ6Pn7U3y+E26b4juMU5A/l/KusAHSElkMfklUagJo2zf4O/gegqZ9bb9KCr
         Evpg==
X-Forwarded-Encrypted: i=1; AJvYcCXa0yc4oJpcIJWqTFSJEpa/t6UfApdNMDTGqAeuoEekK7KBtoKx9avykDDbWmR11FmswFB+8OXirpy6@vger.kernel.org
X-Gm-Message-State: AOJu0YzHFitR84hBQGRuFGFVMqs9kMoBAuz2bH06HdyCv3WrejizUxbJ
	ksrgqUWJ8L5yX4Cr8X1Nrgroy13ZEl7YNKuQRVqPsgycbytFwQ8ECQa56rekYiVEw6kTpm1ycjU
	8SpZbQgeqA7MGBFNgaN8ChMk7OgDwR6ErUS/GAbflWvW6V80cpDgim7XIl4mZL0E=
X-Gm-Gg: AeBDieui2v5kwzaGujW4V95hI0+JhKMagoZEw5cjSwgcrrE+oOf+but4vt2R7FyAOjn
	D3hJWqdgUOtcfyx7F50GFudEbqhU+30mlzDkCIWLXHYg80AmT0xAPTs+iC00xKX7YB5qfZbUgi/
	TqGtaVRc9Qxpt2iX25i4rSmSbzSIgC8tuqq/I/7e3LRZQVPsq1tIM7TrzlnTQz1j/9RWr3enxod
	Ols9pJ3rZDb5pTbsE/kLrQOUWfeeIWycAZdeM+sYWPA3KkgVYWOeZteb8+0/A1yhmfSf5Mt/uvs
	fHGglrJEwsBohmz7N229cSD7QDZS6nIjj/mWSlQJT4RfIm6hZXwx5hES5kV16Es4L2ka4eL4tzP
	BkTPEm3dd526cEbu17/6nRS54EbQlKBHM4LZaDIGb3SS7WLCiLA==
X-Received: by 2002:a05:6000:4014:b0:43c:a352:c366 with SMTP id ffacd0b85a97d-43d595c4f98mr4111481f8f.25.1775726441496;
        Thu, 09 Apr 2026 02:20:41 -0700 (PDT)
X-Received: by 2002:a05:6000:4014:b0:43c:a352:c366 with SMTP id ffacd0b85a97d-43d595c4f98mr4111430f8f.25.1775726441069;
        Thu, 09 Apr 2026 02:20:41 -0700 (PDT)
Received: from localhost ([37.221.85.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm62963480f8f.29.2026.04.09.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:20:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Cong Yang
 <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>,
 Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 09/19] drm/panel: himax-hx8394: simplify hx8394_enable()
In-Reply-To: <20260401-waveshare-dsi-touch-v1-9-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-9-5e9119b5a014@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 11:20:33 +0200
Message-ID: <873414jxr2.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34937-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,edgeble.ai];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ocarina.mail-host-address-is-not-set:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8FF163C8821
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

> Simplify hx8394_enable() function by using hx8394_disable() instead of
> open-coding it and mipi_dsi_msleep() instead of manual checks.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Nice cleanup.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


