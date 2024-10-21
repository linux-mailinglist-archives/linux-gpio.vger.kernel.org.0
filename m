Return-Path: <linux-gpio+bounces-11706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F09009A5C31
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 09:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89661F228AF
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 07:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BFA1D0F68;
	Mon, 21 Oct 2024 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DAvK2dOn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB27B1D0E3F
	for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2024 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729494882; cv=none; b=seekaugXJ3koVVaYoISph/+ERV/nXnAyoq2j+k7Zg2XZ0l6QA04kfX2YS2QWqa1zKY9VUnzVSYtVc8nyezsTi4RqiJI5USOuNAweoxu44b9V+ye1oYCx3OYzKnZ2njgQea8lua0zCUBol4NhN2gJPXSsXTP7bmPbRs0/zOcVGTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729494882; c=relaxed/simple;
	bh=B/kiukLnjmLkwZ+94r2toJOSjF2D/tL5XVrmGqc1MPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N89GcBg+tBS8cQcu0S6XEaw7Db5EWMTcSBx7wk3IWeIPxiGnBI+kMz6f9EM2KY1zDoJGLS/5bz51mk43xKxxyUv07Rjc7chmwzh5aUExwJScvYMkh9mi9kaso22dFhbzTsC3KBDz/jrbGh0WPJlKB9miKLvu4WZZyHJP5pmr6Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DAvK2dOn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4fd00574so2773951f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2024 00:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729494879; x=1730099679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf+ojeeNe2s2EnjRYvZ3se/a+vEw/qUmLYKHSRFy53w=;
        b=DAvK2dOnwcsqPpCaooEwW41R8LlZI5HR+W+8pXzCDpTxIBcETnx98S3WCksW1bg+/k
         QKNrz14SlW9cJ7irfMgj1vmS7l8/rrEi6R4KTsexdfMagNR6T83lTWYjgy4tRf3CR0pf
         QEN/c24UzOnNGwHevcGo2kvyDxObN/0Rpcm0+e4V0Qz7s25Mnf6Rl8FZkcLpN8ytXl8B
         Rltc04Sg1twaSRtOI6LGIc/31KU45JxfBkoembbrc4I0iXzfRPsDXxioyqXZDjgXvvec
         Woe8L0Rd34oMZjTdmkHkzbZuIW3fMF/xNePUlj0UchNImtUYMyNHE4UbM6LyMPc6sahq
         vFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729494879; x=1730099679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yf+ojeeNe2s2EnjRYvZ3se/a+vEw/qUmLYKHSRFy53w=;
        b=InOhhQeMsCwn4UuH+hGTcJG9x1I9lzTR7OtPXtqf+KFpxgYR9KCe78Nee1c1E2kHcA
         Pe5l7d0/qL9QnrgyhQw1EZJZQluDwyivM87lhiX3Smz6lWRLfW1rKDAvIAx3ioEJhi39
         3dbJFjE9bIgxxYZhbMzuESbIOtOJ2BXChI1bPVJ+9piCyD+Z/6VFRdFPHmp0wzrS9jFg
         QSh7S2awfBS5hW6+suUzQ0aAIoelnVEBfpOmzLsp8aSFbPNlx4Mmx75q/ZuzQBe6qIjx
         dBALbqfA7eXDC5J6vtN4dkfApg6RhRUc9sCPnXLlCzRpS3O3sHOyq/E6/pI1i7H0V3sv
         fQig==
X-Forwarded-Encrypted: i=1; AJvYcCUVZUKsDlsk8RFZpMiQRnLjo3k/I5Sbybyv02hBi3Cw+Dy61qv4ZVfU6fU3erqwFcQeM5UNq15E0h9W@vger.kernel.org
X-Gm-Message-State: AOJu0YzTqQTZZf91XTh0QRf9hFgBHwr5jnD8zs6hjI/btP6y16QcOROH
	HcT7JVs8uChz0a+Yfvvbw4hwSjl3jKC4ko17Eh+gxRouTG1OrdLB7Os2WUYTNV0=
X-Google-Smtp-Source: AGHT+IEPnNFxpsQ6/0LGtCAUXpArXCe+i1x1xSkSu3b8PKwSHkfh/ReWZyvmXlCiQ3qXBkcty/eYLw==
X-Received: by 2002:a5d:5392:0:b0:374:c6b6:c656 with SMTP id ffacd0b85a97d-37ecf066385mr6551876f8f.21.1729494878922;
        Mon, 21 Oct 2024 00:14:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b40b:61e8:fa25:f97b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94066sm3525366f8f.71.2024.10.21.00.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:14:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Kent Gibson <warthog618@gmail.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rcu: Fix remaining rcu_momentary_dyntick_idle() references
Date: Mon, 21 Oct 2024 09:14:37 +0200
Message-ID: <172949485237.6376.15649815993285480384.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925054619.568209-1-srikar@linux.ibm.com>
References: <20240925054619.568209-1-srikar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Sep 2024 11:16:18 +0530, Srikar Dronamraju wrote:
> There is one last reference to rcu_momentary_dyntick_idle() after
> Commit 32a9f26e5e26 ("rcu: Rename rcu_momentary_dyntick_idle() into rcu_momentary_eqs()")
> 
> Rename the same so that we are uniform.
> 
> 

I applied it but changed the subject as it targets the GPIO tree and not
RCU.

[1/1] rcu: Fix remaining rcu_momentary_dyntick_idle() references
      commit: a0b6594e411dcae0cc563f5157cf062e93603388

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

