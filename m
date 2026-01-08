Return-Path: <linux-gpio+bounces-30299-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A38C7D06555
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 22:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BBED302BAB8
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 21:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7B633CEB2;
	Thu,  8 Jan 2026 21:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnyBQWSS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7931A76DE
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 21:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767908007; cv=none; b=EoEadKFpaarSbJ+ipR+JYi0hBwcexzxsbQsL9Kz3QDQ3z/44kTk4uOAIMR3jypc/ijVw3Mro4SCwNrLxrXFgcW5AXu0G1kp69O7iCba+xVDP7cRa9SpLaH5h0drZhWNCNGU6JluCum/8mh521nDOjH5lNx+jRROXwlLjSeTRByk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767908007; c=relaxed/simple;
	bh=L0/fE30Ctsj/xrDTmCP+jQkb9IAeWr2/buOUR2E2Y+U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MGvPrWiXc8GnmO6zxYQ1Jvut22dMODgWDaQLMz9mlvjKclppmfCIcCt8VCfzApnB7piwFHAdnNPGgZna2WpJWKiYaa7XBNMkhEhTsS19S2xvAkoi++u7ICNqT9dohALmA8MNoVpElTDfhfuKLJnbMsfJ0jsNgGnZUlbPssx7WNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnyBQWSS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27163C116C6
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 21:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767908007;
	bh=L0/fE30Ctsj/xrDTmCP+jQkb9IAeWr2/buOUR2E2Y+U=;
	h=From:Date:Subject:To:Cc:From;
	b=mnyBQWSSQ3Y7HJB/+C9kthGT/4SvhZSo4s8DSyxt3uSuCelxKKojHVLdcRERrLEs7
	 i53lZjgyNHnJ/JGdhxFTtJcOkmVdEUZU9G3GN4KImMFznQQ5ccacWcGIowt2Sx7kVe
	 sBZNfRqNxkX2K8YTuhz518Y3p2cE/09nz+3hRc2r39xvZp7xvvfMceC45BBpaJrTz3
	 Jqy6Z/FfZZW34EsuQa465P82/kwE89i9tpYNL+/eO4Td4aqDwOothxm2tQKzVNOje/
	 3Zk0IMpuzyy9aHh9goAoMQX7poM5vyVGeb4vs2rvFq9HQsM2dyQmjJWYXO1rQ1cKtg
	 0ddQQqnVwR5UQ==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6455a60c12bso3496938d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 13:33:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFs1G8VNSTwIOGESqYP1Yg45V+q7vM9NbuTal0muymzKgfJ6HjL2Cdt9iDD51d1mGewoZ6p3oi2sYp@vger.kernel.org
X-Gm-Message-State: AOJu0YxZwX8QupcGvhS0QqL3zxwepWfx/TJhJzswsotb0yI7VnwKRs7b
	1vYsnJKh15j+GzTHsuto5HB5YTi1JM0csOXUzuhNpS4xK7nE/vJrgpigdgLMjZWkridEXogmQlm
	bUwcN2aSCPeuTemacdnE2lrPpnN473go=
X-Google-Smtp-Source: AGHT+IHgu2ms8qpT4gjoklQkF/+1KepASICAbvVshq1/mj/AcDEz7NE+T/S4GBv4q9WWSlEX4aZIoMgmHTSEdkiGbg8=
X-Received: by 2002:a05:690e:189a:b0:644:60d9:8665 with SMTP id
 956f58d0204a3-64716c7ae8amr7794873d50.86.1767908006518; Thu, 08 Jan 2026
 13:33:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Jan 2026 22:33:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLn1Ba7MH63VOtGQHDOA7a_2A9Ez0CQG+Mw_LkvhruswSg@mail.gmail.com>
X-Gm-Features: AZwV_Qg_cqqaCdBzKo0pztvuPfbxeyqfM-p3_HFWRB6H-KRUXJF6TC_aVYFItBE
Message-ID: <CAD++jLn1Ba7MH63VOtGQHDOA7a_2A9Ez0CQG+Mw_LkvhruswSg@mail.gmail.com>
Subject: [GIT PULL] Pin control fixes for v6.19
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

some pin control fixes that stacked up. Very little has arrived but it's time
to send over what I have.

Small driver fixes and my addresses into .mailmap, that's it.

Please pull it in, details in the signed tag.

Yours,
Linus Walleij

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.19-2

for you to fetch changes up to ebc18e9854e5a2b62a041fb57b216a903af45b85:

  pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
(2026-01-01 15:40:56 +0100)

----------------------------------------------------------------
Pin control fixes for the v6.19 series:

- Fix the mt8189 register base name order back from being fixed
  broken.

- Add REGMAP_MMIO to the pic64gx-gpio2 to avoid build breakages.

- Mark the Qualcomm lpass-lpi pin controller GPIO chip instance
  as sleeping to fix lock splats.

- Update .mailmap with my new kernel.org address for all old mails
  after maintainers ran into issues with this.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping

Linus Walleij (1):
      Update .mailmap for Linus Walleij

Louis-Alexis Eyraud (1):
      pinctrl: mediatek: mt8189: restore previous register base name array order

Sander Vanheule (1):
      pinctrl: pic64gx-gpio2: Add REGMAP_MMIO dependency

 .mailmap                                  | 4 ++++
 drivers/pinctrl/Kconfig                   | 1 +
 drivers/pinctrl/mediatek/pinctrl-mt8189.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c  | 2 +-
 4 files changed, 7 insertions(+), 2 deletions(-)

