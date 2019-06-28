Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA3D59144
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfF1CjR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:39:17 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:51903 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726437AbfF1CjR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Jun 2019 22:39:17 -0400
X-Greylist: delayed 156216 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 Jun 2019 22:39:16 EDT
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 815292AF1;
        Thu, 27 Jun 2019 22:39:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 27 Jun 2019 22:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=yaZ8S1F4kpu7z+66z1meDyHJPf
        imSKA8ebK+XQtSMvQ=; b=NtUdJbkc1H6xTV2I1gWf5YqUN4TAuHw7T6lBKjQdqW
        anSWElodRu3vvtJkIhAGW9GBuDMJ+OCXK8YiAZtaHQ0xn+6b2qRKzMeedsmj4e33
        L4P2AyyQoRZbisN/lEDLaWuzc85pA0+bleB9Tz3/JitwdMpRB3gPDr3FPxSSFX7j
        fi52LZv3OR5CS1PiaI2YYMKGZNmniqHdxx0mxrc0HnzU+y8b3zBgD7/XB7WNixzq
        axipiLsaJO5qo22jLQ2nFNj+gZBxp8hJuos2QHmARFJGTMSRcINCgSBesivJTKiJ
        Zb6DlX1TGKZQ/TdFsG5rlO61sFNPdLMw9E+zMCX9sTXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yaZ8S1F4kpu7z+66z
        1meDyHJPfimSKA8ebK+XQtSMvQ=; b=1wH69+gbM+nYJEPjyqCx+VxVugCPiDcZb
        xVbI3FrgkTTrAcTAJQCRwBbqrUkcGDFRGULJAkwQTW5PWux+GroMcqTzUzdXz6Z0
        Gc2+xascjMVMjtsLeQElKVrlCY+BtgOU2r0wxKxGh4Z6y4V/RPu9pPwcXb2ZNTeL
        FH67M8iTbfMuxBQiWiKG1dUoe6LcG/9MMGE20T9Nz3Iuknxv9gGhIoc1xKzwZZ/k
        x3kAJHjYrTPRSgVlebStgrVTGvxa/TNS5a0jGneKgMybE8UXo2a8bNlZjhj5y2MZ
        n6I9J4yb+V2cDNHgMejWHIk8rfxHcn9o4YcHxMoS+AzI/d61cPm6g==
X-ME-Sender: <xms:0n0VXf4vXXZim-nddahFx3PYbz0h9eHXRfbqeFD9uDu8QCVQcODwZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucffohhmrghinhepshhpihhnihgtshdrnhgvthenucfkphepvddtvddrke
    durddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
    ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:0n0VXYnkZJjFZXe-swgjdqTBDjNLGt6-jADzwyO9MUXnSLF7_Vij5w>
    <xmx:0n0VXQS_V01O7qUlm_VNF49YQerGc5rbEogO6QskTDtCeYJhLj7uIQ>
    <xmx:0n0VXXFclzcNw5DE0TuIlnwYKAhk4-Ukygs9G-kLM9_vCrLGJgzZ8Q>
    <xmx:030VXTVX5_S09UVLkYsCfSas_ol6uZ3C5_4SUe_YrjcwZdWH7S1v_A>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id B68FC380075;
        Thu, 27 Jun 2019 22:39:10 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     ryan_chen@aspeedtech.com, Andrew Jeffery <andrew@aj.id.au>,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] pinctrl: aspeed: Preparation for AST2600
Date:   Fri, 28 Jun 2019 12:08:30 +0930
Message-Id: <20190628023838.15426-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

The ASPEED AST2600 is in the pipeline, and we have enough information to start
preparing to upstream support for it. This series lays some ground work;
splitting the bindings and dicing the implementation up a little further to
facilitate differences between the 2600 and previous SoC generations.

v2 addresses Rob's comments on the bindings conversion patches. v1 can be found
here:

https://www.spinics.net/lists/linux-gpio/msg40157.html

Please review!

Andrew

Andrew Jeffery (8):
  dt-bindings: pinctrl: aspeed: Split bindings document in two
  dt-bindings: pinctrl: aspeed: Convert AST2400 bindings to json-schema
  dt-bindings: pinctrl: aspeed: Convert AST2500 bindings to json-schema
  MAINTAINERS: Add entry for ASPEED pinctrl drivers
  pinctrl: aspeed: Correct comment that is no longer true
  pinctrl: aspeed: Clarify comment about strapping W1C
  pinctrl: aspeed: Split out pinmux from general pinctrl
  pinctrl: aspeed: Add implementation-related documentation

 .../pinctrl/aspeed,ast2400-pinctrl.yaml       |  81 ++
 .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 134 ++++
 .../bindings/pinctrl/pinctrl-aspeed.txt       | 172 ----
 MAINTAINERS                                   |   9 +
 drivers/pinctrl/aspeed/Makefile               |   2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c    |  94 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    | 123 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       | 250 +-----
 drivers/pinctrl/aspeed/pinctrl-aspeed.h       | 549 +------------
 drivers/pinctrl/aspeed/pinmux-aspeed.c        |  96 +++
 drivers/pinctrl/aspeed/pinmux-aspeed.h        | 735 ++++++++++++++++++
 11 files changed, 1312 insertions(+), 933 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
 create mode 100644 drivers/pinctrl/aspeed/pinmux-aspeed.c
 create mode 100644 drivers/pinctrl/aspeed/pinmux-aspeed.h

-- 
2.20.1

