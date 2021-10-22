Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA7A436F1D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 02:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhJVAzK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 20:55:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:40952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229512AbhJVAzJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Oct 2021 20:55:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A694761371;
        Fri, 22 Oct 2021 00:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634863973;
        bh=/ar7Vm5chhxFFJNLsH1Cx7MqXOvv+yBrbQnZyJ7ext0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ugDqVE5LEFVT7/8vRX1SWqwaJ3I5ScNrEq2t0RusE9J4xkcI7xqNz/rGm+OGE2ePP
         BMnWjwEuVU4FEa0SG+NUNzWfQDzTmJqHjz/8YAsI7FqN/SosBxBTjrADbYZynbiFDV
         3qzPSII+4Tsym20VDjCTxdRgpAQLLFWSrK4esjxbSBQb9Nkuk2Uxv9VEnZhM7AYR3L
         293LQ6kJc7HQFNFMJiGUxryVARloozj1p+HHPn67DnNFu3iJMGX3sYMsbCCXpP9Mrc
         XOYIZ8CdU1kydl6iEJVkbSgk/zUzQyWwMZOYRZQS7U58HsbSCGJuUtOmQzPZmf5yiL
         RhIKq8Di4+ggg==
From:   Mark Brown <broonie@kernel.org>
To:     linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Cc:     Mark Brown <broonie@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        David Collins <collinsd@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@codeaurora.org>,
        konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: (subset) [PATCH v2 00/11] Initial Fairphone 4 support
Date:   Fri, 22 Oct 2021 01:52:45 +0100
Message-Id: <163486395942.2610269.17464570982100143546.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007212444.328034-1-luca@z3ntu.xyz>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 7 Oct 2021 23:24:27 +0200, Luca Weiss wrote:
> This series adds basic support for the recently announced Fairphone 4
> smartphone, based on the Snapdragon 750G (sm7225).
> 
> This adds support for UART, power & volume buttons, screen based on
> simple-framebuffer, regulators and USB.
> 
> v2 fixes some stylistic problems in dts and corrects the situation with
> pm6350 regulator supplies.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[02/11] dt-bindings: regulator: qcom,rpmh: Add compatible for PM6350
        commit: 12271ba94530e7476eff09e98a7de10c31f5d474
[03/11] regulator: qcom-rpmh: Add PM6350 regulators
        commit: 0adafd62505ccb4787d4918fd0b4ca126b754453

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
