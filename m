Return-Path: <linux-gpio+bounces-29344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D45CAB14B
	for <lists+linux-gpio@lfdr.de>; Sun, 07 Dec 2025 05:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 700C3306223E
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Dec 2025 04:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AA4285068;
	Sun,  7 Dec 2025 04:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnBIKHe1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16C4283FF0
	for <linux-gpio@vger.kernel.org>; Sun,  7 Dec 2025 04:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765080346; cv=none; b=H9RFWdEUgny4ZdDfZrQ58MVqoeT61OzF2PU3AE6ufltfzoP2CLHlQtlQFAZGOTTUwMkxuzeYYQNdqgvTAvjWQFXpIthIoOec+PLPdpCW5IcFsCENxTo1xEjIJOcfN8w9ssMmzSl5E3jEAuR/XitcPo8epmke8XuyAvT++zXTE7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765080346; c=relaxed/simple;
	bh=PWZ147u1Ppf7yNYMcL7wpdf1sLLMlRa3CTb2HAu1DTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEpzNEIxIMZb95p9vRd/7+nmmqeZKVxNkjY+pc1AglE5ClS4uTMjmXtvTXeVuBU8PjrEDHw0Li7Cq4sMxCkkpIe82SUYZc3pYsgwyBFcMqO5dG/FuV+ULlh/PjbWYOZqXETdz+lc7JPlckkx1Vp50rA306XHCAif3PGotXLoj18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnBIKHe1; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5957e017378so4428562e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 20:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765080343; x=1765685143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ex2lzVAczuwvkjLV+fgi87Xz5EH5RAk0RHJHjHXLtww=;
        b=OnBIKHe1NH4Mm+UVQtZHs0/F9daQpimjovUkHUhv76Je/Elpjbibk7j8wZNK8kJtxZ
         0AwZkfvTrrzja9Sq+jXQuLYhIXKA1uWdHJ+Oy9VthF7VBXqTD7sDPRLwbZoWSHySsF9l
         +4kaLtbSmRXNxLb5yOxKj6xRzlgk4PrJgqILzug+CIotJK+tl0i4IrzybaE8n0q9sMLk
         Ne6LhZUN6uoKMdyjnUGOMjTl0ZQkzArQfsoHHnHNnn2vfi5UFn22h5JEG2J5ommQU97w
         os8/i1PFzQzclAd8kcB8V6OlZJYNnA1nhMGtqtohqJ5TNjZNGL3EC8mZGUCR+GOuzca7
         Pg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765080343; x=1765685143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ex2lzVAczuwvkjLV+fgi87Xz5EH5RAk0RHJHjHXLtww=;
        b=uiNLCn9XhWIx+HYiD70qXxcCxR5ond8jC1/rRjvu1JE8wkfaSQlfXZjNrKwiG1INle
         YNMPhTlmtX1a4keRz2wPFqvbz9qhMgOt0IEuLwMxk5g3mEihwVdHWRqoxt6mR+uUMlNU
         revSc8nXvJGdBbo/18ykEUOQgzzPkTKqUvR9AD2C/7KrMakHY9Bdz34aL2cLhQtSkrbN
         0wMKeh5+2emp3NbuxlsbEaeuv2DFrivH+7vckjbmFqMdLRQo3KLqNPKOFLdHYwu4mFkQ
         FNvS9lDoEZONX0G87x7amaXb717+VUpbejbdMwXHairti+OdtynRRPMrCumJYDX8zTAX
         4djA==
X-Forwarded-Encrypted: i=1; AJvYcCWn9mMcx4QLs8k4HPxEc+i2o5lTHDpNekVJqdNuPHAqJVOTiExxvbr4QIIT3D+LETio/M8J0cvfTszI@vger.kernel.org
X-Gm-Message-State: AOJu0YyClqRvYdYPPh8zsC+4VgoOXGshYsCLm/YnM+vDS9lx8Cypsg+F
	qx74o5h5XoQSICElJZBZh8nNtHwMvNQxCFhgqbXwOqk3+9jS7ndVzZ/V
X-Gm-Gg: ASbGnctbVqRm7GbPFb3fhEwiKuNbIUMUx9iAKUgm8TM7W28Ntbz//62h76fScuCEo27
	CkeU9WLj6pFRbMkhKnL4yokIrdPdH98pebA5lIZLaY+y+6gJN91rHbS1zmx+Lp3s5bMtm4yayKQ
	0HbNad3zt1i9574jLLUv3/Ujh4PVuZTa4PGBbuNnHMXzvgrPeGzCtAaEPwLgLXG97+CckW89EhC
	/CuEtfyYhSTbTKbZwxYPWT0vSEC2oQ7PfxXBWrHDTrfTTv5Q49C1duYGutkUvikPPkBAkqeSIRh
	2I/skhDViNb5JVO+pq3e19thYySc+VOS59L8BMZZ2h+gfM/5d8rhET/4GQZ5NBVDQ1GFCdPS0Oa
	SGwIisDkDMc1O/t2BNT2AJIaguXItNHyk5tIZXJ9pKYTEbUtJ4HgYaOy1VxvzfCZi6G2Y238ExO
	aSJPT8Aep4
X-Google-Smtp-Source: AGHT+IH8mx3P/9V/pAGu8lz10DNuwJ7kxmYDCtybY5oUGluuyAcyWcsd4RN6gkh3q7lmDuDfA7g2qg==
X-Received: by 2002:a05:6512:31c6:b0:595:80d0:b68c with SMTP id 2adb3069b0e04-5987e8bf711mr934848e87.25.1765080342615;
        Sat, 06 Dec 2025 20:05:42 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7c270f1sm2912765e87.72.2025.12.06.20.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 20:05:42 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: Dell.Client.Kernel@dell.com,
	bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com,
	dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	regressions@lists.linux.dev,
	rrangel@chromium.org,
	safinaskar@gmail.com,
	superm1@kernel.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from suspend
Date: Sun,  7 Dec 2025 07:04:59 +0300
Message-ID: <20251207040459.3581966-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aTLjgEVfLCot0cSm@smile.fi.intel.com>
References: <aTLjgEVfLCot0cSm@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy, Mario and others.

During these months I found zillions of suspend and hibernation related bugs.

It seems hibernation is not well supported.

For example, it seems hibernation is not supported on Chromebooks [1].

And Fedora intentionally disables it by default. [2]

Other operating systems do similar thing. Hibernation is hard-to-enable
in Windows [3]. macOS on Apple Silicon hibernate in very limited scenarios [4].

But I still use hibernation.

So, I have an idea. Maybe we should remove as many as possible hibernation-related
code from kernel to make sure that remaining code is easy to support? I. e.
maybe we should remove some even-more-obscure-than-hibernation features,
such as hybrid sleep mode, to make normal hibernation easier to maintain?

If you like this idea, then I will happily write patches for removing
some hibernation-related features, such as hybrid sleep mode.

Other ideas:
- Remove uswsusp (i. e. kernel/power/user.c ) in favor of normal hibernation
(or vice versa, i. e. remove normal hibernation and keep uswsusp only)
- Remove hibernation to swap partition and keep hibernation to swapfile only
(or vice versa)
- Decouple hibernation from swap completely (i. e. hibernate not to swap
partition, but to special designated partition or file)

In short, just tell me what should be removed, and I will happily remove it.

[1] https://www.reddit.com/r/chromeos/comments/y5pol9/anyone_know_what_the_status_of_hiberman_hibernate/
[2] https://pagure.io/fedora-workstation/blob/master/f/notes/hibernationstatus.md
[3] https://www.groovypost.com/howto/enable-hibernate-mode-windows-10/
[4] https://www.reddit.com/r/chromeos/comments/y5pol9/comment/ism352k/

-- 
Askar Safin

