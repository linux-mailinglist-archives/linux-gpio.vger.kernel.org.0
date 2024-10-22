Return-Path: <linux-gpio+bounces-11753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FAE9AA25F
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 14:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C33528349C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 12:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CA519C579;
	Tue, 22 Oct 2024 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ys1SotQF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3AE1E885
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729601135; cv=none; b=F0IdB7yjszgUHk1J+xMsj1IOMdgTdhEP3ePWz6SzJZq/kEY74TsE5E5iZR42A9s4Gl6dxRGozIWlt2NLhOcksHfp3XHLFk6ilMUXjwkT/BjSqm68bs9UKXD16zZ8iKFE5N8dvKT+A9MY2/GF5s0bkEQs2DLrEbQ3kDRrNUtnzRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729601135; c=relaxed/simple;
	bh=WmPfsYC5XxLwxgy7QyhoKQvCTq1ZP7iOmD4cZtl9AQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkH+WI6stFtHXbxlN7JzYmJQT9GZRoXBeiG16H3akZ+Eq2F/IDiWe4jNBEcPkvbygCuZFiWZtzm14PLzo2hdg++FCexr31W6wiXp0uWw9zFXH9XFJ1FTBFOHEj01nu+jJcNTZJOCFHouHimEprXCHP1wQ6YyD8TKolWc6ae//2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ys1SotQF; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so55962141fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729601132; x=1730205932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmPfsYC5XxLwxgy7QyhoKQvCTq1ZP7iOmD4cZtl9AQw=;
        b=ys1SotQFqgck++FDGN4LMK3T3+1PCjlyd0nRj/JpYXEWJdRbL+z+bsNt6j0DW/bnWu
         tp0GsNZuMDiyb7k7dlvs+dltSNehbtT7Qu3K//8bgARPQYW7NO4iqp8YH647g2SmljwE
         uETbDNhunRMH1/HjkIFbq2ZwAffMsUPHnQN5XgDuprVhQNek/L3HJW9GjitbMCvMBUW1
         4PHcFSRijqw/8GkDwAZRKQJWEaUd6lheFIbIUsBr1iIQmrAASX4FssyvF1m5tZ8uXzl+
         7WuplLOYVLKw6yweIKR9UhPi0XGMY4SrCEXAjpnE8vWVEsvaUV4NTcoaoFw2e4Qc4R1h
         1H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729601132; x=1730205932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmPfsYC5XxLwxgy7QyhoKQvCTq1ZP7iOmD4cZtl9AQw=;
        b=UggpFSK+bioy0kXBJGh+CIONnfdibDRbLmWQ5lA+khahOxgOPDlIfW0gm/8f/8mVz1
         bjvZfCr2ouBEfLG4gueygAhXEZfHQY4NfK0nHxu3hdNhDgoSa/RUfVzNaqfaSGcQ0k1k
         lxxBM/wTYRif9WO4hTBkhMPzNoYqbNsJwWYuJj+HDPZ6uSFudyT7uC40Na2XZbgv4/F5
         WQGk+aizwk4y6Fs+6CJnRseKh8J3wy1+Qn7UzayqHmWVBGrtnOTC9Dmr5UAAARC1jMLQ
         QQ2+/ILyFLN1eT/TLaf/C9zJmDpJFhii9xztKW4/96U2gn9i7YPAYTbPaZEQWqgrOnPk
         6O2w==
X-Forwarded-Encrypted: i=1; AJvYcCVxJXqPER9bwpiGlQbCND5jAIfgWWtQKzMK/LinQcvun0JU4++0WXg9PThlxnb1ohwXuuUBJYurS4qu@vger.kernel.org
X-Gm-Message-State: AOJu0YzsPT7vdpILJnBa5fiB8I0s7NaUgj9/ZAwFLavXZ8Zbtd3jZxlA
	wF6hKf/QoTz5VoL3EwUttt6352t/7jrqurCQAdn+3PK99aiv/pVupxU28i/uN4XMD7wEwK7eT3g
	YuupBGsjlwWM3+juzJBollQb7knRPlRIFIetgsA==
X-Google-Smtp-Source: AGHT+IGcIByKZtdq0adKPnNWneZwqEUqTIt73JdOZNS52T9t2MPtuTBH2U31H8pdlHUFENcf3DKQJdHVOhl8MRblnkY=
X-Received: by 2002:a05:651c:211d:b0:2fa:cc12:67de with SMTP id
 38308e7fff4ca-2fb83208e04mr71395491fa.32.1729601132347; Tue, 22 Oct 2024
 05:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-sar2130p-tlmm-v2-0-11a1d09a6e5f@linaro.org>
In-Reply-To: <20241018-sar2130p-tlmm-v2-0-11a1d09a6e5f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Oct 2024 14:45:21 +0200
Message-ID: <CACRpkdbOf+VyUYXV-SM0ua1RpoTxuHhu9OCZMFKBOHmN1-YQfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: add support for TLMM on SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mayank Grover <groverm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 10:42=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Add driver for the pin controlling device as present on the Qualcomm
> SAR2130P platform.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Up to v2, bindings ACKed, no reason to delay this patch set so
patches applied!

Yours,
Linus Walleij

