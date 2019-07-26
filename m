Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B848075F02
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jul 2019 08:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfGZG0x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jul 2019 02:26:53 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35409 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbfGZG0x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jul 2019 02:26:53 -0400
Received: by mail-lf1-f66.google.com with SMTP id p197so36241838lfa.2;
        Thu, 25 Jul 2019 23:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nnLng03yKzoOCov75qSA3MqCcOmyhGOuTFn/YZRC6bw=;
        b=QY77d0thwiUD4ElvhVAy5MKyD6fafSxKbtUv9VmsptPFHHlvme/Z5bDd9kco83+dOz
         CJ1t8DkfHzgcMv66CGkufSFrQ6n5xX1QBja5olBDwVAevTLMlXef1BbefBr3tHHrLpFK
         XK01aB7P2BDn2Bn8YP/I4KGqK7/vKpw7Qf7Q6C7hz31pREPZpTvVdpMWcJGUILzoTv+T
         QM6N/YfrpJzm0vXuptrAaE2BUOax/gA9Y3ArgX4Lhrqb9QsDVllkWQd5TBNvmVWvVc/a
         dMXl4XuC6Dq3uFjwMkRbaAVeIAnCwIOoXUe76JsyaUS7+cqO1ASTJmQDItIWMIvv+66A
         tbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nnLng03yKzoOCov75qSA3MqCcOmyhGOuTFn/YZRC6bw=;
        b=oArE1I4lE9NBJ91fqswpzYjAt80Zj4u+z34Oj5Bzg0fZbuXtOSWgjc4tU047gvnuHu
         i9MIqMLyXd2NLkBotlWhYo96Cf//9ZiAoqffohWAVa0FZ9R2bnhPLrnKg00nKD5LN3se
         zprugjYnNh494kywRxdt5Zvnfbxg55aI/+DlFOLy/6Pw6Gr8k38UAMSAVOvmXw5s6U7g
         9+3VLZXce2xI3JZEji5IYPzY4TB8ozIQz1aZ74vRaYBg5koxvOiZQvKXPbOrChaURFc0
         aOo5hhME2CxEVOM7t5oO/67/fnG6tBjdHBldZlSNvXI7kNXyJZjGTV8g1lbWRTdFaDl8
         CUhg==
X-Gm-Message-State: APjAAAWdo0I/zJ3VjjhZZi6cQuFw1HZj/Wdb7F4odKzGCi/k25xNTmnw
        U4LRZYU5lVSSK8s+k+Eys2Q=
X-Google-Smtp-Source: APXvYqxQGcfDkp5SBeDAZqV+MRX5iBECRKA/CnzStUstMtYBdbgt64kzQ037siw3JTVdCCysd7N8QQ==
X-Received: by 2002:ac2:59c6:: with SMTP id x6mr8532542lfn.169.1564122411084;
        Thu, 25 Jul 2019 23:26:51 -0700 (PDT)
Received: from dimatab (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.gmail.com with ESMTPSA id z12sm8129347lfe.2.2019.07.25.23.26.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 23:26:50 -0700 (PDT)
Date:   Fri, 26 Jul 2019 09:30:55 +0300
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>,
        <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH V6 17/21] arm64: tegra: Enable wake from deep sleep on
 RTC alarm.
Message-ID: <20190726093055.4d8fe3ff@dimatab>
In-Reply-To: <1563738060-30213-18-git-send-email-skomatineni@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
        <1563738060-30213-18-git-send-email-skomatineni@nvidia.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=D0=92 Sun, 21 Jul 2019 12:40:56 -0700
Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> This patch updates device tree for RTC and PMC to allow system wake
> from deep sleep on RTC alarm.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

The dot in the end of the commit's title is unnecessary.
