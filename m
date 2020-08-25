Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF848250EF6
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 04:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgHYC0K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Aug 2020 22:26:10 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38487 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgHYC0I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Aug 2020 22:26:08 -0400
Received: by mail-io1-f65.google.com with SMTP id h4so10935530ioe.5;
        Mon, 24 Aug 2020 19:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MVs+XZqfKwaKJqJ+/fAMeb4kyiC4Q663ysaFu8EcOcQ=;
        b=LGIwGe6vX+21BBD7TSU/k9oxCoT3MPoXUB+lUdhCriC9qEB0bhPhg3pbogYL/Fp2dU
         56Q1v6Z91N63WmWn+4abmj9uvHqmqc+F6iIkxTOW9v9SUq3TjS7LuuT5TuVmdBgwxENv
         qmK46ZW9jyWvffQ7iJuVO0arTukYOkorlkr6XFHRwxyiLhHsGYHMTkIXbyNxiXgfS7Wj
         Uc+uHcBcqQMYPr1ecFsr7g9EG3H9hhVqiT/K4nRLJc06u8kzXnLusTrtFtAfWvcRxJ0z
         WV0XUjsoRQ9UCVHCLEEF8lTNqXhrXfapkVVbmOoQ0aBPzPUfFnzEXHzOMvcD0TMKKl/H
         8vxQ==
X-Gm-Message-State: AOAM531VNtQV0ENI86ARTDGWpp4PmuMx4CdQI6c/CpaMutMiiT7BOyeG
        NAWXRNV86nqUdhj5R2yRnw==
X-Google-Smtp-Source: ABdhPJwVLmUWRG3eEJmfYl9RyJ1uZxvCuvTxZNwyP1GM7YPLTJQdPSI/9oTn59Tl7UOcBEJlJ58bYw==
X-Received: by 2002:a02:9307:: with SMTP id d7mr8374323jah.71.1598322367810;
        Mon, 24 Aug 2020 19:26:07 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id d1sm8144326ila.67.2020.08.24.19.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 19:26:07 -0700 (PDT)
Received: (nullmailer pid 3816273 invoked by uid 1000);
        Tue, 25 Aug 2020 02:26:02 -0000
Date:   Mon, 24 Aug 2020 20:26:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
        erin.lo@mediatek.com, hongzhou.yang@mediatek.com,
        sin_jieyang@mediatek.com, sj.huang@mediatek.com,
        hui.liu@mediatek.com, biao.huang@mediatek.com,
        mark.rutland@arm.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
        sean.wang@kernel.org, seiya.wang@mediatek.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org,
        chuanjia.liu@mediatek.com, linus.walleij@linaro.org,
        jg_poxu@mediatek.com, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v4 2/3] dt-bindings: pinctrl: mt8192: add binding document
Message-ID: <20200825022602.GA3816243@bogus>
References: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
 <20200817001702.1646-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817001702.1646-3-zhiyong.tao@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 17 Aug 2020 08:17:01 +0800, Zhiyong Tao wrote:
> The commit adds mt8192 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 155 ++++++++++++++++++
>  1 file changed, 155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
