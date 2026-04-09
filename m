Return-Path: <linux-gpio+bounces-34936-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPiYKTRx12mDOAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34936-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 11:28:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B63C875D
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 11:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB912308428D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 09:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18C13AD52F;
	Thu,  9 Apr 2026 09:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZJKFtal";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VRDSMsEi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776533B19CC
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726212; cv=none; b=nIXcT20bmK2sjh7lKn3SZfxf2/yVfwwFONehD+17KagJ6c2Dz1B3GLG3IQviZ7ca67BjLLsYoNwDd5qKz85dOln1yVb6orCboMD2zUddmLST0qlCjB+Fd0VhAh8kE6fUkFntvFon4icuISo3mMZP2NP7dHncUJj0Lx0mbGWutGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726212; c=relaxed/simple;
	bh=iko3ZMq1VcoBbjrOB88oRT+wjsUB37QQ+unEQMTF6Ts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pEfK9KwuOzWc+LUxSoU2t8dlrxclfWPDJTNY/s82Jdqv01Z8i0ScNPA+VDCDlNXQ1/OG7nSO+UqbqeLfzUHQTxpxGYEJkIxH+VTWFGjfK0VOllxh7mLTEibihgnfF4vz+/vwt1O3hi6VEd3ar9SjvYoug77NMarxh6n1nh/qMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZJKFtal; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VRDSMsEi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775726200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TgulYGZEezauT5N2y6RRbPYOtNJoV6tHbCggzEseWxk=;
	b=aZJKFtalTrmaUvvCzIU8rMunRJ9q1bY2F8yC0T5UBzgAYb3FcvvDXaFX4PzM3xzRq0/9U0
	/UsuB/Px/hsZHTYtNISadycEUYcDqQU7RuNFjpagmdPqocWEGmWSTzJVV5DyPJYkojbE3B
	kvySC+72VlCMApnG/YGmJWbn9u6igF8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-06cyxli6PfKYp6hUiyR7Lg-1; Thu, 09 Apr 2026 05:16:39 -0400
X-MC-Unique: 06cyxli6PfKYp6hUiyR7Lg-1
X-Mimecast-MFC-AGG-ID: 06cyxli6PfKYp6hUiyR7Lg_1775726198
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-488a75d674fso4903295e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 02:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775726198; x=1776330998; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TgulYGZEezauT5N2y6RRbPYOtNJoV6tHbCggzEseWxk=;
        b=VRDSMsEiXft22BANVwF13eJddy1KP3F8JNASGSoc5YPLVcYAHUeRNz2cI4l0Bh767Y
         wgn3nmhx0nzX5OO5MUyVu3MfAqXv1PtaDVct4glql6aYAwbpKUoLxhCWj+lhD7MoBcNJ
         2FJT3kZxXCLlL/CO1E11Ah3wRsrphoS0ZHaL32wTRFKLKr+/pIJhZO8eRoSCHxJ/QbGA
         402STQ/5UOjPLY6owSV/Q/VIzgwXQlhtCS/4PoU3fQTXdzUv+dTnnwcgmU5KdRWc+8sp
         VwaZrt5bEHeFAHXTxgtuXR70ONCUR6D/guVgYn15Ml/L5tkamTQD1COhExfmQqSSbxR/
         0HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726198; x=1776330998;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgulYGZEezauT5N2y6RRbPYOtNJoV6tHbCggzEseWxk=;
        b=L+u42I/Hamhkq7Xj33Gsn8J21f4/l5rDpyiRh8MkegqfVWDydJ1/CygaBtotFYbPIO
         5DjSPrqQe2H9oQAC+5cunzt0EO3N48FGFtjHrWizEoLKQhYmhYwrIWmYmfTMlM+TntOU
         hiZo1SuvbH2xIRH46sl+LErqylqft2Y6Qf26yANxXdXgNCx7v8EwKYGfPyN1tkNWfMA5
         t2nvC1K30fHDNMLrtBnE2vmYeueWkFIz1oxTCWWN8WoTtrg8uosThTBurmyzDxQr1BR5
         +h+X2/A59txS0G3CbgBebSl+soRMljyNrfOfV6oyMYZ5sEZ8FHhp3I/6PRZAM5q+3azB
         Cszw==
X-Forwarded-Encrypted: i=1; AJvYcCXYGhCTcp36Jf7ADfa/ZAuvi6hYFlGniZPAsMiygJsAS4AZzN/RPNiB4/eAie/kqpCx8Gyp1PtrS2wR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ZvKpOFAsildG7QdHezNBjjivo06O8VjdD9JcG3hDOFGl4P1N
	Lc5VXi6AfUD52K9injeAzjvtweY4rKCjje61XMzIy0gB6kSE6sJlezOeZI48ZjvfW6Ov2ghyn9t
	9BxaDMHsmKGBsM659Ee+As42yrPhr2s6gjwc6H61Ky+kjBx0KFJeeyjT62OD8trE=
X-Gm-Gg: AeBDieu+gvURSwHfL7fFZI7N0lCrrkuwwYCFwDpvsjG8PJd2rgPBDlEBVQ7pOVszM+b
	9GzpUFpAzPwGBzbVPdNihdubqhX8O5HfXw8IYsGc53w4K2jXxXRi0ypXnWOg5ia5aSxoQKCVXfA
	5Vv+o0OSt78T3LDmF1z5hGFmFGFZ4ufWxZHsSJ9qU1dgwinFqqlIpokQ96hp+jF58J7AocmOHQj
	1v7qWmdN8AeCG2Z8btf7RIMNCDjXQIYltEcqVKsazBVhQwhkVTNA90mRg2erUgHzgWSndsPYjCq
	nW8fmu3gAp+7bIkZVw2hum/wl9BmO3Am2BdE8qyc4crziNdu2DnbewotUsBNDkUDPONNDmUxANS
	eIJ3oVYIi8jdy1s7Wxrj7cTlhtk5FXXmnrtLiKdhuZkEQCTxBXQ==
X-Received: by 2002:a05:600c:a47:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-48899781357mr360437585e9.19.1775726197774;
        Thu, 09 Apr 2026 02:16:37 -0700 (PDT)
X-Received: by 2002:a05:600c:a47:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-48899781357mr360437115e9.19.1775726197287;
        Thu, 09 Apr 2026 02:16:37 -0700 (PDT)
Received: from localhost ([37.221.85.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd19f3f1sm18879355e9.34.2026.04.09.02.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:16:36 -0700 (PDT)
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
Subject: Re: [PATCH 08/19] drm/panel: himax-hx8394: set prepare_prev_first
In-Reply-To: <20260401-waveshare-dsi-touch-v1-8-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-8-5e9119b5a014@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 11:16:35 +0200
Message-ID: <875x60jxxo.fsf@ocarina.mail-host-address-is-not-set>
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
	TAGGED_FROM(0.00)[bounces-34936-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,ocarina.mail-host-address-is-not-set:mid]
X-Rspamd-Queue-Id: 0D8B63C875D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

> Sending DSI commands from the prepare() callback requires DSI link to be
> up at that point. For DSI hosts is guaranteed only if the panel driver
> sets the .prepare_prev_first flag. Set it to let these panels work with
> the DSI hosts which don't power on the link in their .mode_set callback.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


