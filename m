Return-Path: <linux-gpio+bounces-23574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B2B0BE4D
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 822703B81A8
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0093A28A1D4;
	Mon, 21 Jul 2025 07:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JeAr1Qcb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD6F289807
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753084552; cv=none; b=MaHS/Fhc3lefIjC/+TFli0qmOPGJiMc3VC1EVPLRbQYDrNa1MfhVBjKE50jbvOaSuqCk1wkLsyJq8pb7a63PpYoepsRw+Z/K7w05C4i1WzFb/fBAjd7HjAFj+Ji/v9NYtFCq9gMwUcIn7YAq+LwHLLadeqwV2DFfzHIgKy92rKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753084552; c=relaxed/simple;
	bh=N5j8EZlqTt6vKNu77Pz6iVUnfchvxwo0qd3CQlXNE5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSUKBW6po+3I8x13U9EVMzj5Kb2+hsuzvY+77FdJsvjigN3Z7U0z2pS3bAv3/nQJGJfNMXPOoH29rCeCiarXEHbJAdtd9A+hrhpNiqpqnI/3eYDJbPq4PDrYy1/UAORD0vZBAkDJkVyNcsWgDqsnxaqQmdEgcbSCf/iQQDOtf2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JeAr1Qcb; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3835164b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753084550; x=1753689350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=scvw/cm+favkInK7QNR+mSExk/PSyHNkNkxMayXJ3Yk=;
        b=JeAr1QcbVrC1RWAHxCInaHF2yAhfl9rzouCX9g0mlaTvEPw+yNXHgJrypcki6Getwl
         ogDRhEBmZxMrcES9VDfOV/AQQoJ+2Gb6txi7UYVM9QbAgl+h0C3oWfpJLVJEf0HSHqtT
         kqWsiZwASTaxZ5MmlO6O9vbSLfC/wBmsyylOgwap/E0zXRm2cbn2P/iZ6EVpeP72ntWV
         z85cr6ORLW7te57Vfkw090N+nNiBRyb5MBrfcoTy/z1zl66LwLHDV1V9lHoVx9DtQE1g
         zEzD2u9xQVUa95YVI95c57kSg0EsKNhgInM6sVpPKvkcFLqnPyWSvtOwlKBQVB7wjDj5
         y3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753084550; x=1753689350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scvw/cm+favkInK7QNR+mSExk/PSyHNkNkxMayXJ3Yk=;
        b=A5JpyDuTJy7dy4Tv/NmIaDd4w5iUoBB/UTorRIS+TXLzXQLlV2R+uzvAeYRYvbfHJX
         31EDSRFROouZNqFvnskNMMIoAjnOxM05DidVmPD/N2q1LtaJi301MPrRqczzE0uB79cF
         t3NjqqaKRrVKQEY9Ee5+bc4q5+u2uZOzuuurPjyuowsmuU6oTOp76Jq5Xx2lEoaYMbtf
         4B/FYM44GaczQf4prWMW7z1Ctsd4UMc6pAXbDq7OYdE484f5kDiUCGwXy9FlNFOfXge1
         R9Z119/10pqIObuX2RUXTO11KW72CYMkwknUC85mNn1jeOtO6gfJzrblSNKFG1D8nFkl
         qM4Q==
X-Gm-Message-State: AOJu0YwljMyMEqG6cdvrJnkRFeQs59GpbSmfHOFsiiaPmbV8mfz1QjIe
	Dk7x/ecBCeBv6G3kBTCgr1xjzw7PnVGqyPZjibTCXj5E0JAyrhVMKEnxCQpzcPgR9BM=
X-Gm-Gg: ASbGncuj98Fa4VygknQwK5mLjmCYLrH5H92Uf1U2wkB/J4qTbPROI1Aye18pEo421nM
	r/z0WH2KbwzSihV590Lc93wtyHmZ53Nd/EZo3lK5AZUhHSt81ZFIGhosc/bvh4wPCt53HqqVf01
	DrbQdw9HhZdf5S+SjmbnX1n63m9QkuPD/Qtsu87oVKiRfUd2tlI/RFx14zReS2NKzR6aGpcpenH
	s5pFqI0dP/TzLFoDNbF5E0JLYJxtXUXjsBnm8gJ+I2dXxi8tmM4eroJ6lRpx6vZepFGOyQH9f04
	b5zS0qk1Sq1waXLURA4voHHYEiVBx0VrqWrnExrpFqrWOce1cTe4qb628ZT8n4SRoS5w8Z29AVX
	ib1C7MC/1IzK/6GODCFCwt3H9wYbYxQSZrw==
X-Google-Smtp-Source: AGHT+IH8IfpLhI+lhw7uOqjQtjs5Nnc5yMBWQY7NcrP6bX0rkU/0OCoNGgM50IelbKub8dw3I9eo2w==
X-Received: by 2002:a05:6a21:a344:b0:21f:4027:b9ed with SMTP id adf61e73a8af0-2391a2d8d16mr20194585637.1.1753084550290;
        Mon, 21 Jul 2025 00:55:50 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe66216sm4769519a12.10.2025.07.21.00.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:55:49 -0700 (PDT)
Date: Mon, 21 Jul 2025 13:25:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Erik Wierich <erik@riscstar.com>
Cc: Linux-GPIO <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH libgpiod 0/2] bindings: rust: fix clippy warnings
Message-ID: <20250721075547.7heyiqx4dvvkx2n2@vireshk-i7>
References: <20250721-rust-clippy-v1-0-2ac0198b2ea6@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-rust-clippy-v1-0-2ac0198b2ea6@riscstar.com>

On 21-07-25, 09:53, Erik Wierich wrote:
> This fixes warnings reported by clippy 0.1.88.
> 
> Signed-off-by: Erik Wierich <erik@riscstar.com>
> ---
> Erik Wierich (2):
>       bindings: rust: remove newline between attribute and attribute
>       bindings: rust: simplify format statements

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

