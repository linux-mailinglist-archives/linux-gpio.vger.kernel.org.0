Return-Path: <linux-gpio+bounces-16224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AED67A3BC6E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 12:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 741B918886F8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 11:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF83F1DED4C;
	Wed, 19 Feb 2025 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k2jIb/FO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDEA1DED44
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739963342; cv=none; b=nmbN7I+nl3usvlyqDSJ5rJA48dp8beFgYBL7R+C97sEB8SjHZhjHb4vvF2It8AXG9DG/5zfXgxnKRg8VvaGAJEPbEX6+n2ZjzWjNA30p7RJE962QgZDbtGXeJVGxIxSBSuI16yjkrseqirWxQmWJaLOWj6mcWjbXnJyTrfMyPbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739963342; c=relaxed/simple;
	bh=cvlaH9bP1Ejwnm0RINb1NYM/JFKbZqpkIyKiOdyhiaE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NMtFhn2SSMMUvJk28f9sOz1JYG0TDoaep+Pqj9uBDMsckFPI4T2lDxsh4zRFUyXj51CUsFoXJSHuYp+lzwO5XQpp8Yu/RKXvufl0Wl8mo+nTwPd/vCH+oHqErAF7X3zBhlSS+4SBPMYvPyOieMew7jpMhw7mFpuIEnPmladB2J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k2jIb/FO; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7dd005cb0so95716966b.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739963339; x=1740568139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIQn4T+Ol8k281C344dwvV9xtdIPcPz3ZnNCTAKTtPM=;
        b=k2jIb/FOxIqoqhZdXiANWaSgiy0MxHKOeyahb5pMBoQ8LaY6qSEd2kI+53R7jeEbW0
         qrWpfHM0nfpo6ftXVprBz/yN70CunrhPouJ86Q6KdZtEMs/kzp6uRSqBSNUCT2p6+meH
         hwgFxb9OQIanNez/irel+s3TYaapkWu49h1ZU40g0vR8EOXyhcFFLEI1P3q520w1+rJL
         kUZ8/3tURLFqs1YYm7B7+7qpG71BqXpihb9lhh/TV3H8Pnk4aXHacgYESSvHLr5WUywm
         P6RJdSCLep/mwWGiKLcmWEEX3fixuHFTugUWxG+e6uioHFvGq+cCjY08D/DlgKd5qtau
         h3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963339; x=1740568139;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIQn4T+Ol8k281C344dwvV9xtdIPcPz3ZnNCTAKTtPM=;
        b=RCWofigwGZh2L8mebd/yP1MIFCYm5lJRUhBtIDkQNCLchC5FQedVyV2/QpvSrjKrFw
         GhGMxbsBRXKh6IySSSY04G5rrRM31xr/T/kjY+K8vQmKoLgx2cdUx1+2Em/SPxWp19h8
         qauYw6+1HG9LK+2IwvlLrTUPnQDFo1evYady2kySK3J/ek5L8WjCq+fb9bND69HNmacT
         QPzOXzSBXeeWq4U4flLQx0Q4l5c0BcZlXb7TZkd72hgWnX7oVXYeXFG0w8k6N+VBVRqm
         /NruqO9EpMpe3WJ5Jyl+6uDu0L3Fn+3s/0s1B/rZGxKewJCSbLBSQ/TCC2ygZ/bogUdP
         J+BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyT4QIhwgzlQstFtql01s4zYTqja2AYxg/GpXZtmBun9qOmDZm0UdKaMmqnAArim1CsCt9Ti9eagyT@vger.kernel.org
X-Gm-Message-State: AOJu0YzmfHJ9hYV/vv9PEf/mMCh2sHvKCsl3ArrlFw2QpAZ24bsv/eTu
	7JPJAADRNZxQ/q1VddxqiGrez7YiILrbNAuxSr9T6mX3djJLlrTF/txUelp0mhudH8UdmnxDese
	ZYMs=
X-Gm-Gg: ASbGncv3YV/fFlyMHe501sqxI+LAvouOwYvdWNK8N0u/QmkY6qXx2LVuUHX2ARyyauN
	irilswVsCKzhw+aI5ZZUXw51iyglUnttDvmTrRSpa20sN7drxNXmEnuaCfBkdOpSJp4gqbzfgFU
	9N4TQnZ7eahDSPzFLob/pfihmyzaI7Aq+W+s7q7NWBqS0TYEZ0Cra/TKrAOv5Ep3QoAiCaawrsN
	wBJAowRJtWbQDyZ3UnDbdTISTivwm4xhsVsjJBfzaDqn+m9uB3tA9Syld6BhxAUkklK0JjsX9K0
	U7kbrZV1h9VRvfxBlflghcBlKmJDyfo=
X-Google-Smtp-Source: AGHT+IEe+1BQ8AYZk91y7yXjhMM+ta1+WK/nmzl8UeGC016o3r2DG8gtpQnMR/wNL+rcqmeldzltmA==
X-Received: by 2002:a17:907:7248:b0:ab7:bb4b:aa49 with SMTP id a640c23a62f3a-abb70ab878bmr651662466b.5.1739963339206;
        Wed, 19 Feb 2025 03:08:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4fc0c29sm475464466b.157.2025.02.19.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:08:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: samsung: add exynos2200 SoC pinctrl
 configuration
Message-Id: <173996333675.137445.366892422452609954.b4-ty@linaro.org>
Date: Wed, 19 Feb 2025 12:08:56 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 15 Feb 2025 13:32:45 +0200, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds support for pinctrl of Exynos 2200, as well as
> documents the pinctrl and wakeup-eint compatibles for that SoC.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: add exynos2200-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/aced1f7b82b1594189be98ba7c51d0a60a4a279e
[2/3] dt-bindings: pinctrl: samsung: add exynos2200 compatible
      https://git.kernel.org/pinctrl/samsung/c/bbdb937962f2261355e48965b631742d12629451
[3/3] pinctrl: samsung: add exynos2200 SoC pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/574d0f2120b8e7e6a218d81267f4b543d586df11

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


