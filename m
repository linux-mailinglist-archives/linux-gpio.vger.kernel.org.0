Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA0644AC0A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245473AbhKIK7l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243352AbhKIK7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 05:59:41 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4165EC061764
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 02:56:55 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso9664787otj.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 02:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IGtrT+gnnpsR0/gVYlOIaWpMhonGwBEUrxBXQSHrjhU=;
        b=NIl34nVU4mG/qNE+35FGntC+uTk/zkkV7JBjLzvzXUNEjWb64bvqJzP83W40Q6qrrj
         mIXsXwEX3p0BRDfLOob3dDi9zOBjCJUDAhv0PZN1N8pl4Xc9tXaHxiOx9daTafWdsen8
         HuyOR6Lmtft2JQhH9QS5+OP80VeSlH7PzdyEwECdXz2siyhAsqsWwNhERdeD/SqKrd+m
         F0U6ipagYbbBCsNjHxMW1b5qYOIYbzuQRB9N/CLWZVzGaDDZWFoPyr/X2iiK4UrJBTRV
         Oguwx7oUNwN3CklUNN+YLN6t4zLA5HE0qZWJ2jXfWj08RB+cBvvndsh300WthoUsdcr2
         x58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IGtrT+gnnpsR0/gVYlOIaWpMhonGwBEUrxBXQSHrjhU=;
        b=YN35wV8nk3OkMr0OeXW4EupAa5Ss79eo0Qp1YQEZndcdkzbDuq6sppdKH9Zmy2oCbZ
         9uc/Y7lREp03jE3ZRQBQnlmxwFLwpsb/ADuloCLzX8wmZ5NN6NdJkoePyo1GndfBfYQv
         Q+vN+xUa1UZWNnchyTn/bUopb3vA+bJtjXd1cWpRAp3GZ5dMpHEKXdyWvx5zJqVQFEux
         3B0FFSn6+yXMr/VS++TVgzuBiZf4zntvBjFve64OGsJeGMsPsTSwhNDgbTyx8raUWSN1
         3DXIxNpUXwft8X5taXGEbydyKBtwdoDgdE7Akk6gJfiJg5+QFiYYZF/Nh9Gewz1ly3u9
         xnyw==
X-Gm-Message-State: AOAM532lHWLAxeuFOtTeznnQ7IDHhThpd3GYlgX1nX9ApLA44PD3nx7C
        gVLsVLjxWFon/Wr5nwfNW27EfpjRak1qbF/tfJ1YrA==
X-Google-Smtp-Source: ABdhPJw1vDnzJxJSL3+aJKMbdb8O/s8SxhL6LE4Xs5UeZxJAC981kXaeEazfyqWtipnMjgFbO0RnWP5BVqUnDbWPfGY=
X-Received: by 2002:a05:6830:2809:: with SMTP id w9mr5074019otu.237.1636455414603;
 Tue, 09 Nov 2021 02:56:54 -0800 (PST)
MIME-Version: 1.0
References: <1635552191-16505-1-git-send-email-quic_vamslank@quicinc.com>
In-Reply-To: <1635552191-16505-1-git-send-email-quic_vamslank@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 11:56:42 +0100
Message-ID: <CACRpkdawbTdb4BsvKVn_oSs1Az9PPXG=MqoqtSRtx=ftQU54_w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add pinctrl support for SDX65
To:     quic_vamslank@quicinc.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 30, 2021 at 2:03 AM <quic_vamslank@quicinc.com> wrote:

> Changes from v2:
>  - Addressed comments from Bjorn
>  - Collected Reviewed-by for the patches

v2 looks good to me and I think there is timeout if anyone wants to
look at the DT bindings so I want to merge this, but it does not
apply to Torvalds master.

Can you please rebase the series on v5.16-rc1 when it is out
(should be monday) and resend?

Yours,
Linus Walleij
