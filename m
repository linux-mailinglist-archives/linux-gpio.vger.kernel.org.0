Return-Path: <linux-gpio+bounces-23687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2389B0F13F
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 13:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1308AA2FF5
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 11:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EF42E0924;
	Wed, 23 Jul 2025 11:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YtWWXbZR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B332327934E
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753270387; cv=none; b=BUCa0EGitNHIIxo+JRopKASuUFwYGBwgrrCwO0RbwSDAQ9/uT5ESwqjK/ZXtIRBt+BM+0WwoyX1PgjKKZGMpNRu+Kc5iBMDcxVkYXKx9TK69SfgbJLTB7UG3G1iG+ZeEQpYZiHNjBiY0xuC9FfKP26W1vfp07z9C0QoZw70JnRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753270387; c=relaxed/simple;
	bh=aAjvSl8CP8e8poOdqbC32WczsF+aY5e0wedprJiV2Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qICFzeULlJXl7OzzbXVKIlI+lM2CKdce1oE6GvRwLCMmQIpURfiUfjg2X2tv6Gl6tZ787eKmwsqzjZPcdh6xorE9PUnSWiCQlfLZf+F9Vvpiw4Q0yxeEfQD8sAPzgh7xO2+ph7jarAeUd61c+ROWzFss90rehwJ/OJTJB/OJgHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YtWWXbZR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55a4e55d3a9so1438543e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753270384; x=1753875184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWJ1vaC9mhdphahBr4AxdkgQcamHOy69P9zg4SNDFJE=;
        b=YtWWXbZRP+8yhBvBXY22DxrsIWNl27hACDq/BJo083tD+gw6mR3Gu96a2Wzyi3qRyW
         cTwiiXYWJVK6wtou9ie7ChC859awFYv4BVVN1DBkumd06ViaqNdPZ90ps7FE6pFviDqf
         9evPVGD/liatxLrR7sDumg8OtiTk/GIbovA/VsUW+kQOx3TJ1R3uh5CXwOzpYVZb98+C
         cEg55gR5NLlrj8Mbd2jY+67JS8V52N/ONlt8ciV790YxzFU1t34zDCq8tewelpfYcV63
         0obiYVynZtY5obbzW8Ua5oTYacoNUUJV0INZ7TmAbxwj5kGEHeJM/KlmCPCpdXXk4t6v
         PTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270384; x=1753875184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWJ1vaC9mhdphahBr4AxdkgQcamHOy69P9zg4SNDFJE=;
        b=CMLqiAgT6j0l2EVt4ExEYQUU0LMH/eJHjAKNe7P4J/XjsbmkC9HlXxvyHzTDd7xiBk
         MEh6TLqYZ3EZxpqiaUcRRfF2pbMtDEUm/Oy8Lcyqnd7jiV/vYMn4GlQrU3+bjY1IWrMy
         yB+G5KOYWoyZ+cCF2ACpcS2sdNjULWlBLt8Q+jsRJLCXh5Yz2mx59YPhmWQ7L+c1XcLl
         1xAl5qYBtcFV0Hjl7JEfWqXq5VAM40qPFohlSz715eALodbJve08g9DYRQ1YrOe8n8oK
         bt8Ap3QfQS7CYTOhl3As1fYGgpn6f0cfjcBifzIyXoD56/6M1oIWlYPtnBIUHRWA5a8F
         o4bA==
X-Forwarded-Encrypted: i=1; AJvYcCWtwEpsbcLtbvkWfheP0VcRAr4ig+sWlGQB41rlo79kqmnaSpDGb6fduWwx3Bdyp7DvQQYfL93V7i1p@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw73n/ktEb4vW/KWQDr25roWlETn0usPqu6fexrY9pOR5qTTmt
	TKH+X+ZK9qzAqe3iS4i0kAsddW8i0B1KpzO7GjSV0XCcVsCPI1+txH1uLTavFBtrkp5nIpv4HHT
	ecx6jSU6sm87ezbqXpQ/ccczeUtQZj60uXK7Fz4hISQ==
X-Gm-Gg: ASbGnctSoXc+B/MLF0mQxhHbLNYSGB5wjXL0bSW0P3iH6IdH4nUPg52m6bUmQe8/zvJ
	S8Oz9TJKbGuY2FyP87pwIL2rlwKh45LgU5o4001zXJWQUkOVcgtkMa5hpBSFW2eyocERq7q9icp
	cO1e/vKGLAVMEonSCwCWwiebw5hi5z9wQ6cC33kUXslpVck9L8KFObdE5sbrP3Gqzf+uvrTpiLl
	ikRyl8=
X-Google-Smtp-Source: AGHT+IGAxN/JXh1EsU6InJKjwWnNX99YeFSCDuYAjM788AXYCd+mzZfDQU6t+N5nE5+MTj/X0VenBnfY0SKgi/lR+VM=
X-Received: by 2002:a05:6512:3e1f:b0:55a:826d:fa31 with SMTP id
 2adb3069b0e04-55a826dfcfemr569462e87.37.1753270383732; Wed, 23 Jul 2025
 04:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717063042.2236524-1-christian.bruel@foss.st.com>
In-Reply-To: <20250717063042.2236524-1-christian.bruel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:32:52 +0200
X-Gm-Features: Ac12FXz0suPsP2VK94jurXo8uzOTltHa9LM0UQkrYO80w5wNLroNiLg4heFForw
Message-ID: <CACRpkdZHw8am05Qcjp7FJyo7D7bZcvzZKVjdB7BUCq3FuQCy8A@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/2] Add pinctrl_pm_select_init_state helper function
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-pci@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 8:33=E2=80=AFAM Christian Bruel
<christian.bruel@foss.st.com> wrote:

> We have the helper functions pinctrl_pm_select_default_state and
> pinctrl_pm_select_sleep_state.
> This patch adds the missing pinctrl_pm_select_init_state function.
>
> The STM32MP2 needs to set the pinctrl to an initial state during
> pm_resume, just like in probe. To achieve this, the function
> pinctrl_pm_select_init_state is added.
>
> This allows a driver to balance pinctrl_pm_select_sleep_state()
> with pinctrl_pm_select_default_state() and
> pinctrl_pm_select_init_state() in pm_runtime_suspend and pm_runtime_resum=
e.
>
> Christian Bruel (2):
>   pinctrl: Add pinctrl_pm_select_init_state helper function
>   PCI: stm32: use pinctrl_pm_select_init_state() in
>     stm32_pcie_resume_noirq()

If Bjorn Helgaas is OK with it I can apply this to the pinctrl tree.

Otherwise I can also just apply patch 1/2, but that doesn't solve
any problem.

What should I do?

Yours,
Linus Walleij

