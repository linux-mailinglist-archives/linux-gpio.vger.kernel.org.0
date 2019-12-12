Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1BEA11C5F4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 07:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfLLGeJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 01:34:09 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37369 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbfLLGeJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 01:34:09 -0500
Received: by mail-lf1-f66.google.com with SMTP id b15so786653lfc.4;
        Wed, 11 Dec 2019 22:34:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=tsgISRT9nMqn7DtbA+3ig/4ziAEQqFlvqbhmxo2BOXA=;
        b=M6qRhMzNPiauKMSkXt8t/PQ0Bpbp/GPTLMbxi9RcK5ZRC28MqtqBDw6kSgWE0Mm5BH
         GpAiOUbUPMXoG3zEYSzGmBU2TmV/3QnXHPXgynOmm0f+l7VtcOSfHezKhgGjHWsXsDNV
         ok2gheXSt6rLMoKaTNPqNyjolZhwqNPAu24i8QrB7GvUSBYWlVvN+huiz8RuXjVqv/Db
         PwZFmXDWewmmc5OEa2RDjZeWEMFcBwQP0u6aKcB5G/3WhwcLrGNXG2oC3tX2OPZwz9fU
         MM12P51YYTSjJsH+IHvrMNbIBaDQOf+pdELrgq79IkBVkMIJ6v7UhWhNR68cNVs5i/in
         HujQ==
X-Gm-Message-State: APjAAAUXHieh/rKRv44rQROasd+JYcQnAgYMSTS5oI+GGmvRfCVMO+AI
        3+37iTG5N+no7GDlK7i1khY=
X-Google-Smtp-Source: APXvYqwcO1EBpNCrSVsbfjdToy0npzPSrlOSfa5qmD5cbpeISW76J5wn0ZZUhlANoXHcSR2ncacx+Q==
X-Received: by 2002:a19:f519:: with SMTP id j25mr4687723lfb.41.1576132447488;
        Wed, 11 Dec 2019 22:34:07 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id n5sm2342265ljh.86.2019.12.11.22.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 22:34:06 -0800 (PST)
Date:   Thu, 12 Dec 2019 08:33:54 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Use new GPIO direction defines for intel pinctrl
Message-ID: <cover.1576132131.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We added definitions for GPIO line directions here:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?id=9208b1e77d6e8e9776f34f46ef4079ecac9c3c25

Let's use them on Intel pincontrollers too.

Changes for v2:
  - Replaced ternary operator with if() for better readability

---

Matti Vaittinen (3):
  pinctrl: pinctrl-intel: Use GPIO direction definitions
  pinctrl: pinctrl-cherryview: Use GPIO direction definitions
  pinctrl: pinctrl-baytrail: Use GPIO direction definitions

 drivers/pinctrl/intel/pinctrl-baytrail.c   | 4 ++--
 drivers/pinctrl/intel/pinctrl-cherryview.c | 5 ++++-
 drivers/pinctrl/intel/pinctrl-intel.c      | 5 ++++-
 3 files changed, 10 insertions(+), 4 deletions(-)


base-commit: e42617b825f8 ("Linux 5.5-rc1")
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
