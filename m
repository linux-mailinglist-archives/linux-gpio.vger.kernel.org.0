Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2945034D1D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 18:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbfFDQWo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 12:22:44 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34271 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfFDQWo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 12:22:44 -0400
Received: by mail-pl1-f194.google.com with SMTP id i2so4205366plt.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2019 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=Xpjq9bw6slADT5XCKmt0erTi9PTdSuDRNC9m5h9fUkk=;
        b=YUJDujuiWHJHMvNYD3L1Gz6F8jaVKgQZQqlqTNcqZmoo8heqS9GzRSWuBdYHy0ZsTN
         RnIINRo7NVy7VfZknlFtNXSB1vyXygQ/TKOEXtM9LiTUugYZEWgXyB0p1auiKrhr6JPj
         ZBUNdP9/fO5M96Cc/ttzxbSmKv8jS91EuMLqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=Xpjq9bw6slADT5XCKmt0erTi9PTdSuDRNC9m5h9fUkk=;
        b=ubvapYGqaltyIw/aXrt482AZxlPd1Qr+9NhUEQ8qUrcLO/koadzG9EpEsX+N9LkBzG
         xYVH2FVMb4uiDdGB8d47L9ti28APmo8bI/dj3hwMNqN4Qt07hbkHYTY+4D6CM3jd2Uf5
         HYqj+B/8O9p3pbZJKBsSzb1A/H4VHdztQja/SBbpMYuNEEyg9nqNCw+ZdEeuak5vis3U
         wPfo6IIqJ/OTgCYekNyzy7XXvBdFaKi1yCtS92G4+/JyRpqZ/oDGGPr5mP/wg5aOnUyM
         cHFm36QkI8wogA22MjndJ/9VoJEhtKIPgBBuq4AWXl80g1+Y4zNqEI55JVQVUDNHmSTu
         q8lw==
X-Gm-Message-State: APjAAAVxuzRc7ePCRGDwEmovmPpfh91/12502xqGBJhLQQWLt32A1P7L
        sJe+yMXpPHJVSmE+tpfd2VsrdA==
X-Google-Smtp-Source: APXvYqyVXG8EIds+qzy7r1wtzTPqaJAQxUcsAxNH581QY9KBnrRJOGctYgOl+qzV8OAs14fzo3+vng==
X-Received: by 2002:a17:902:bc8a:: with SMTP id bb10mr38409335plb.310.1559665363394;
        Tue, 04 Jun 2019 09:22:43 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k8sm6855524pfk.177.2019.06.04.09.22.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 09:22:42 -0700 (PDT)
Message-ID: <5cf69ad2.1c69fb81.216a9.30f8@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190604072001.9288-4-bjorn.andersson@linaro.org>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org> <20190604072001.9288-4-bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Evan Green <evgreen@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-mtp: Specify UFS device-reset GPIO
User-Agent: alot/0.8.1
Date:   Tue, 04 Jun 2019 09:22:42 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Bjorn Andersson (2019-06-04 00:20:01)
> Specify the UFS device-reset gpio, so that the controller will issue a
> reset of the UFS device.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dt=
s/qcom/sdm845-mtp.dts
> index 2e78638eb73b..d116a0956a9c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -388,6 +388,8 @@
>  &ufs_mem_hc {
>         status =3D "okay";
> =20
> +       device-reset-gpios =3D <&tlmm 150 GPIO_ACTIVE_LOW>;
> +

We had to do something similar on one particular brand of UFS that we had. I
think it was an SK Hynix part that had trouble and wouldn't provision prope=
rly.
Either way, we did this with a pinctrl toggle in the DTS where the "init" s=
tate
has the UFS_RESET pin asserted and then "default" state has the pin deasser=
ted.
That was good enough to make this work.

	&ufs_mem_hc {
		pinctrl-names =3D "init", "default";
		pinctrl-0 =3D <&ufs_dev_reset_assert>;
		pinctrl-1 =3D <&ufs_dev_reset_deassert>;
	};

        ufs_dev_reset_assert: ufs_dev_reset_assert {
                config {
                        pins =3D "ufs_reset";
                        bias-pull-down;         /* default: pull down */
                        drive-strength =3D <8>;   /* default: 3.1 mA */
                        output-low; /* active low reset */
                };
        };

        ufs_dev_reset_deassert: ufs_dev_reset_deassert {
                config {
                        pins =3D "ufs_reset";
                        bias-pull-down;         /* default: pull down */
                        drive-strength =3D <8>;
                        output-high; /* active low reset */
                };
        };
