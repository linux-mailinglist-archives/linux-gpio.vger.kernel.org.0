Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 587C53AF55A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 20:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhFUSss (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 14:48:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230291AbhFUSsr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Jun 2021 14:48:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8539661107;
        Mon, 21 Jun 2021 18:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624301193;
        bh=G2wivm1SL+bm/7n4q2pZN3wn8lBMoRzv9Fh+X54SWCs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jy2V7ecni9064dCbkOtCvl+MrUtgvtig06inHRh5K72oaYbRUooPzuNNPHXBEaFoN
         CXokIIY/B6bK8hBX0GRpnf8mAv9H7wqSBPCAP65pj9VieHNDkoyZ6ZLAOwSqu/UWbI
         WcvRQqDyVeOWgQWdfGD0vi0rH2+fvZhn0Gf6Y1DrmC3hjMdt74WgrDb2cxt4unaY45
         MpPVmJeBqB/4zyF2TJ9EJercekL6lT39f7XR0cbHAtSym9gqLeduFvjln6poBFlZw7
         JlKBTWe7Q1s1WkMIYnrflw1i9H65rDhYkGIo/IKlw6wubae3DOox2s+0whn+31b7BG
         QQyqGDsmOxL3g==
From:   Mark Brown <broonie@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-gpio@vger.kernel.org,
        lgirdwood@gmail.com, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 0/5] regulator: qcom,rpmh-regulator: Add support for pmic available on SA8155p-adp board
Date:   Mon, 21 Jun 2021 19:45:50 +0100
Message-Id: <162430087046.9551.10979726950537776436.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
References: <20210617051712.345372-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 17 Jun 2021 10:47:07 +0530, Bhupesh Sharma wrote:
> Changes since v2:
> -----------------
> - v2 series can be found here: https://lore.kernel.org/linux-arm-msm/20210615074543.26700-1-bhupesh.sharma@linaro.org/T/#m8303d27d561b30133992da88198abb78ea833e21
> - Addressed review comments from Bjorn and Mark.
> - As per suggestion from Bjorn, seperated the patches in different
>   patchsets (specific to each subsystem) to ease review and patch application.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/5] dt-bindings: regulator: qcom,rpmh-regulator: Arrange compatibles alphabetically
      commit: 85adaac269c36d8e2e0a5de87a1dc4ec06e984f1
[2/5] dt-bindings: regulator: qcom,rpmh-regulator: Add compatible for SA8155p-adp board pmic
      commit: 66376e152303bb60d6a75328b7bc998de86f8c08
[3/5] regulator: qcom-rpmh: Cleanup terminator line commas
      commit: ba5dabf40e9143ff6c48943b76a532d5ab34d0e8
[4/5] regulator: qcom-rpmh: Add terminator at the end of pm7325x_vreg_data[] array
      commit: f26cdadad729743888eb4ac2c17eac3cf845b493
[5/5] regulator: qcom-rpmh: Add new regulator found on SA8155p adp board
      commit: 9a336ed97d00bb69547272fc7d0439802bece375

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
