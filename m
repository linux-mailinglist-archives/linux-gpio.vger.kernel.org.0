Return-Path: <linux-gpio+bounces-35463-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FJyNsMm62muJAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35463-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:16:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528145B4AD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EB0830160E5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 08:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258F63859C7;
	Fri, 24 Apr 2026 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eApoQHjc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA46636F428
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 08:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018500; cv=none; b=iIpN+0gObni0ElrpgBneb08dfgnBBMFFKjH3Ryh8Is5OpWzVKga1/yAkD1lTMY7kS0jUirr6Soogp2RP5vzQ7jJ436mVGpFAuW56LEDwRKLcouLON4SDzEOhfOr011b+Q9ZKkDWbF7a2Xbb7VZ2NZUg9eaY/3XKGGz4KfFfAiUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018500; c=relaxed/simple;
	bh=9fyu30Oftn9ohfIUdEzIbgQz3LjGLQmWulU0txjr59M=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqKbR6Yq3K+T+q8ii3wUIUDJInYriAvq+z/rGofutMbJvtmNUveCS2dM9Cp4B3e6jKCknwjTYBwGFBmDBd8TbCvkFiQKjDxhHn3uOi8gCv4WvU819oBmV5bNRycf3ovdXRNVyLqBCvwFQFiLeDBXGWUdeV54W6zxFALs94zVkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eApoQHjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903E1C4AF09
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 08:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777018500;
	bh=9fyu30Oftn9ohfIUdEzIbgQz3LjGLQmWulU0txjr59M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=eApoQHjchj5JBxhPcsli/ymo5qto9jxKmoRTtSM1ZfaKlGQ5p3MGGgwvIw6uVzybd
	 2UfN6JnLEjhcKNd2jtlSVmRf+HhvSy3PFuHgzAwhMsggZNpG3+KZWqsEp7QNgFddLL
	 zFxQ2U5bUmpMg2staGmksCrSaq2JpGgA2mudYitwJ64a+ekUltDi50D6JU0dxFIsYO
	 tIasFL8q53DHSebCqKLcdHyoNvdRpEabVTJElAW4mni+0k2Jro0SBvc4zYsVwUuFsB
	 eOKqt7I9YVmVr4rSfnF9Yh+T/8lBNt73MFZvqkqdfIe27RqW4yAosz5WELR0B+z+n6
	 sMGxAYI3FmPmQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e7d984096so83288741fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 01:15:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9tFkoDmlhXDTkgGNzXxBSEzgvda+p+vHkT+qfEsSPa6S11Xlq+6036HVj8O99LE80WBVeL/bRSvpdj@vger.kernel.org
X-Gm-Message-State: AOJu0YwVQ0LRrGqoz9SiK1Rh8Q0ZodFIMtAXwzjGB16MKvefQa6cl9B4
	57NvpNxtlZB05wrja3KgpUG/MKxfub6Pfuonz2vkG1CIC7WhSK4dtbLRil95nGT62dM3LSEmquK
	o8tN7MMdReBDwND3oDqTH6KdIqH4q5tS6B7S3ryDgng==
X-Received: by 2002:a05:651c:41d7:b0:38b:f632:e0fc with SMTP id
 38308e7fff4ca-38ec77f6762mr94772331fa.1.1777018499076; Fri, 24 Apr 2026
 01:14:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Apr 2026 04:14:56 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Apr 2026 04:14:56 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260424-ds90ub953-v6-3-7a84efbab316@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com> <20260424-ds90ub953-v6-3-7a84efbab316@oss.nxp.com>
Date: Fri, 24 Apr 2026 04:14:56 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc4OfNV5++4qAFsqqLc4DUeVK7fyZqHYtZQvSwmZnbnuw@mail.gmail.com>
X-Gm-Features: AQROBzB5gvtfuPCI7WpxRRoySyjcEEuN-HwXoxfW5uWOp8T7YWLltn6XjRSIokA
Message-ID: <CAMRc=Mc4OfNV5++4qAFsqqLc4DUeVK7fyZqHYtZQvSwmZnbnuw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] media: i2c: ds90ub953: use devm_mutex_init() to
 simplify code
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Guoniu Zhou <guoniu.zhou@nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7528145B4AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35463-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Fri, 24 Apr 2026 03:42:26 +0200, Guoniu Zhou <guoniu.zhou@oss.nxp.com> said:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Use devm_mutex_init() to simplify the code. No functional change.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v6:
> - Added Reviewed-by tag from Tomi Valkeinen
>
> Changes in v2:
> - Move PTR_ERR() in dev_err_probe();
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

