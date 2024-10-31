Return-Path: <linux-gpio+bounces-12343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 683389B745C
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 07:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCB52282B74
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 06:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D6813DB99;
	Thu, 31 Oct 2024 06:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nl1sJhFi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190053A7;
	Thu, 31 Oct 2024 06:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730355405; cv=none; b=t/jTHa2r93naUxOCow60IJA4eXK20G5C0gNkZcM1MqHalFVf50HkoGgx2tl7MkM2AWY4MPUL+9MHfBcGdlxAT33c0ikEyYjS4CNKzrh5WD8ngDJxEXWwGxLjAHrBu09ABP4ns/nGHVrS+h2Z+zT5MriKyeESTE2nE7q1qt788G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730355405; c=relaxed/simple;
	bh=j2HlgDp8+u9hg2vkQed2WwynkePj63eEmVQB7+uORIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPUrN2uq1v6XMIQ+45EF3SdHQc9IWjADEC65CU7SM84l+0HERBw2BoWBfPLeaBuzcq0jViYpc7CQf366gmLltEhXKjIXPBc6ZR7gCAZlbOaQmEdtd2db7nL/ET+/riBzIZc9RdVuEaVIbfhMc8EAUSuL4UrjFdlD41SEPJoK05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nl1sJhFi; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a6ababa9f7so432745ab.1;
        Wed, 30 Oct 2024 23:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730355402; x=1730960202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EuWXK1FTmmyHPdq/HX3ciQnkpD6mZ9pTPXfUjDd7qVw=;
        b=nl1sJhFi0froFM6uOB+lsx3c1o3xOqI4QKB2B2vK7goFUp6c4vZTfu64Ymmxjy4e7T
         YTarBGiGZPlYZhvbQtTrYeV+ZTXsfGOW/xASm582v/ijHHRs/j9wj9mgNT9K5TEr2zmH
         GiAw/VtkzwUZFzVdCtSbeAkqMTr5usvfUzqkDdyhAOydCSatFv3XYpXNortoH3vXVCW3
         VkBldVme3xQkJmz1N5+Zv22Jjq2YsLnFZIC5w6YykBnyQS+nVy806DUhDCNNcF+AFiVS
         0T85LwA6b9xg92EAsC9wbBF428k65AF141QsbK+7BLcB9ZsFXTz0SDmpp1Hk935V/FZQ
         pFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730355402; x=1730960202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuWXK1FTmmyHPdq/HX3ciQnkpD6mZ9pTPXfUjDd7qVw=;
        b=T7pHybiGT7UtwkxXQs/Os5ifejssmCtNoKXLSOUGtgdMEX4QcJoKXpOo9migoGtLZz
         qhJpqYsHTNQG4AIM1Xcr8Lf6mKIkcgb5NxC0ZtP3qELWMMThN6pz/Y5KQS29PApUyxoo
         UGZryJEG8MD5hFCn290/TGjtEvhm8OOY4WcpH7GejYF10vLcEDJ3aYMHscH7mWD4hQvz
         g4wXaZf2uPy9Fs2CzAWI16IvXJLc22dohEjnldmZh4+3oqPTPxzYa6TJpkmFeKlaBPx3
         o6QmBIfiCfzOlhEQLVud3vVUDfQXJ3Aa4OC73RNElD7PgRmX486rQo4hDg/3DA7FbqHN
         nISw==
X-Forwarded-Encrypted: i=1; AJvYcCUY9krsVvvPjXpILJVY8ugWCo4+hm7OnkXRCyeoirFSwuVDMpWzFxz++Xd7oIGukCEmcXUyH4tjkgmK391h@vger.kernel.org, AJvYcCVCnzFw8KurK5SYtyf3I2uz1T4p4wggBINvXOzo7UM621P5kp6DYRNbTsnrNqHeZcGQr3OUJYHLB+zSeQ==@vger.kernel.org, AJvYcCWObjyx/GhiWx4H47pBZLj/W29GNH2jiviORA0HNqikRPT0TMO5Y029yUG/6q27CL97AVzm2SfWmVif@vger.kernel.org
X-Gm-Message-State: AOJu0YxmtuvZsgl6gat9jlGL+t1JUFw3rA7hXLRnZjE/wicfADFbwaXG
	5ZLa90SLi6aFuoZMbX7ofEmYhQXp1Gbc77RBOBQYjKdjykR5aW6z
X-Google-Smtp-Source: AGHT+IEjlco9iARxa0bQC4eLe4X9RvrtbLwAsHFCOo4/n8JV2mCJn3xvzg1nlMhFCJCWEVeRqZ3nSA==
X-Received: by 2002:a05:6e02:1c29:b0:3a0:8d60:8ba4 with SMTP id e9e14a558f8ab-3a4ed2e066fmr9182655ab.16.1730355402297;
        Wed, 30 Oct 2024 23:16:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452aa703sm499528a12.27.2024.10.30.23.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:16:41 -0700 (PDT)
Date: Thu, 31 Oct 2024 14:16:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, linus.walleij@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@outlook.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for
 cv1800
Message-ID: <3vgu3mw6eqdbv4lbenihpgfouupspeivfox7qu5upxdzfl5l4y@azhfscgilvfs>
References: <20241029012312.3448287-1-unicornxw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029012312.3448287-1-unicornxw@gmail.com>

On Tue, Oct 29, 2024 at 09:23:12AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> It should be PINMUX/PINMUX2, not GPIOMUX/GPIOMUX2, see
> <dt-bindings/pinctrl/pinctrl-cv1800b.h>.
> 
> Fixes: 64aa494de6fa ("dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.")
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> index 1e6a55afe26a..feb4785a3fac 100644
> --- a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> @@ -58,7 +58,7 @@ patternProperties:
>            pinmux:
>              description: |
>                The list of GPIOs and their mux settings that properties in the
> -              node apply to. This should be set using the GPIOMUX or GPIOMUX2
> +              node apply to. This should be set using the PINMUX or PINMUX2
>                macro.
>  
>            bias-pull-up:
> 
> base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
> -- 
> 2.34.1
> 

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

