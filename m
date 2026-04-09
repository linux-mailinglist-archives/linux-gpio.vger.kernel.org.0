Return-Path: <linux-gpio+bounces-34935-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEQVK29u12k5OAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34935-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 11:16:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 281393C855B
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 11:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 319DF3018779
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 09:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CC0313267;
	Thu,  9 Apr 2026 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LWgeGWt3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aTWrSx7U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA923B3884
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726126; cv=none; b=KKwORqUg9tZl2KEDzcJM4Ztv3HyYnn5EeWcMkji99SueAQ5G3KqJvjcY99FlNxkDuN/M8BM9MLlR1l9qDtMKYAWLxSPjlHUhRF12+VOUmAKyRLPLcM4HYP3Eo1g377t4+BsGpgP8szcgey/SYiE1VbqfaYT7PWuugL/BpI0/pMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726126; c=relaxed/simple;
	bh=pJ8j29nhqqhgbVnU8JhcZWZPeuekDoQ7N1F1dwxe94A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jrQfJRcKN4r85uz/gG+sB3TiZ/+FMFWmKU527EfJS4LoobFbHSU0GNKiOqZXXsx6zBgjfeuSXV0PkBJq21aNYDbi2VqGzQKI4OYye/hqo1CZoTOMwkgL2xLgf1RMmp+KuctfbV26ao0GcWQAp1lswokp6fUMSXqyf5xkWZipB4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LWgeGWt3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aTWrSx7U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775726119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bKk/qgaXfCtywmbbEPA5j7wB85nwcXgi7ZycM7rdkR4=;
	b=LWgeGWt3+M4OChIRUy9+IEPo//UKA6w8buVfSlAvGJ/lwKlAkeI9D6jgpHsCAK85GTK+t9
	1/T2eU2EpENBVCzT0VERELvGDiNC7Rsd/MHTMmE75lCOkmmqwQV5HlrrvRY2Qys5eVutF9
	JcbBfVaaTOpsaA005Z072Qs3IKIdYcU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-5uX7KnBsOrmOc-ytFQnlTg-1; Thu, 09 Apr 2026 05:15:18 -0400
X-MC-Unique: 5uX7KnBsOrmOc-ytFQnlTg-1
X-Mimecast-MFC-AGG-ID: 5uX7KnBsOrmOc-ytFQnlTg_1775726117
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d5651fedaso598616f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775726117; x=1776330917; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKk/qgaXfCtywmbbEPA5j7wB85nwcXgi7ZycM7rdkR4=;
        b=aTWrSx7UnYFsHba9266rE6znOTN6JGoJQWkcppf4uL96alDGryCOlZ7NP+y2xEV4CV
         hSqaHorB8u1HTP7YqcmB4ikGDf61zBWmg+6VO0pQZkZlKQp4z+3JP+L0i4bHwvZBUn/c
         eTGLVckrc9b2pV3OgrISy17wXhcfQLPGkrHvJTPKQhwF+smWOPtdQED5QjRBbSHDTj28
         iAo8Z0vWAqWZny6NeBk687CSk1O05KmuHw/K1TBMIusjRBHu4iNpxWJ+9TBV0HpFZxnV
         ZMnqM1xXoxcGSFBNDfgKxRuUEvKBYrS1L6asZMfHgEG0/OyjiBwisd0UrW9rsO3L25ZO
         RSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775726117; x=1776330917;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKk/qgaXfCtywmbbEPA5j7wB85nwcXgi7ZycM7rdkR4=;
        b=o4PHL3SvE8e3TV6sDTqbh9A0ezpqY70DV14BoLI6eTrDDWVU6bubUX8Al3M24y/yGa
         zN0oNpNe+5//xFTsOSls7tetkkR27DrITmg6psm4oMUi58p5Sj/rzYRfyQ9/zK02BH34
         csngMa0RHXZ/oM/MozLzeTuxurxbLVQ/SMgTwK29VGvCWdn3igBQ+M2Dc/q6uO2ut2yk
         gwohjEGYxdn317d9uolMnxtoKgDXS2JSTMa23oMwNsYpYB4MlF3khtFv2Z97+wduPiiB
         dm6Z4/OHFk0PSgUNwd+ITOH6bCQJUDAEZqH6RdMhsQgiE802SpdemmWSWIAa2+Gp6vge
         u1ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUgcRkG0dyOZFu/MjTn0E0b2Yc+GYcqbr1RKUCcIsxtQby5vzjE1Tc3RibAAokn9L8y0I+BTPoG7fKX@vger.kernel.org
X-Gm-Message-State: AOJu0YxVptQ5Ae/7i1lUob6JwlDDxw1CFEZGvRNqy4LhGSjMx7r9r4pz
	kOE8FuU2Odh2wg7JokpipBpIkxZTE+2HOlMqg6RKuUlwV5yR6x16BDJWzMyqbDKKDB0YFVG5W49
	+v7mAp88vO4Hx6ZzfXxqUuSh9nTb7fcsyo0j0kPqUvAN5rluSDtNw/xrZvZY0RLw=
X-Gm-Gg: AeBDieuqX1XD4G9PsMfjbAHirzE1eNE/rbAnu9ZRbuo/cj6CIISDGKZcJcKi8QLS4uB
	Me+o1QuqI1Y9VwQWZHKLXLpn9785IfL87W9peB58E5kouSgyZYvQhJsiZtOvrIVVqakeKCu0Lrn
	tfkmfhMoQuaqsNOkIdw994TZmeR/Jror6xEZS8qB3frIu5JcZcDiEWfF3vsceEkrD68p11bRTov
	c2afKPHfy1vBzBPR7fYGX03ALu9joezJI1Fb2+eqK1ODUOvW3jtEL8bqYwZG4Ri7Aebhbs4+xiL
	srmpJOqCjbal0m7AdnNsq+UfFzKT58ag6sUEyQEr8ZmHH2aj+dUEDCpWwyzq/xbKtNT83OntQv4
	tWrOrJd9SbJA4Fbo16OO2qLCu/gwi2cOQQVEfdr2IukyVj5RwHw==
X-Received: by 2002:a05:600c:c0dc:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-488cce7760dmr29725675e9.0.1775726117039;
        Thu, 09 Apr 2026 02:15:17 -0700 (PDT)
X-Received: by 2002:a05:600c:c0dc:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-488cce7760dmr29725145e9.0.1775726116563;
        Thu, 09 Apr 2026 02:15:16 -0700 (PDT)
Received: from localhost ([37.221.85.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d5e969bbfsm2718936f8f.1.2026.04.09.02.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:15:15 -0700 (PDT)
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
Subject: Re: [PATCH 06/19] drm/of: add helper to count data-lanes on a
 remote endpoint
In-Reply-To: <20260401-waveshare-dsi-touch-v1-6-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-6-5e9119b5a014@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 11:15:09 +0200
Message-ID: <878qawjy02.fsf@ocarina.mail-host-address-is-not-set>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34935-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,ocarina.mail-host-address-is-not-set:mid]
X-Rspamd-Queue-Id: 281393C855B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

Hello Dmitry,

> If the DSI panel supports versatile lanes configuration, its driver
> might require determining the number of DSI data lanes, which is usually
> specified on the DSI host side of the OF graph. Add new helper as a
> pair to drm_of_get_data_lanes_count_ep() that lets callers determine
> number of data-lanes on the remote side of the OF graph.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


