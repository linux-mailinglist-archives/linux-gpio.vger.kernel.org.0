Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFC3FE53D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 19:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfKOSsu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 13:48:50 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41777 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfKOSsu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 13:48:50 -0500
Received: by mail-pg1-f196.google.com with SMTP id h4so6398301pgv.8
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 10:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=fmszmsa19doMDiKVkd5JyjEU2EGslIacVXAuEqSrae8=;
        b=MJ2Vf728p+IDQNuwMyN+qBbVI4AXW+zK1iJOm+FRbwoS7HdhDVqUq9ABoFNp9GHfv1
         +w6YXWJM4nwTjAD7AuZ6fu5mqIU+7o5jh9j+jy/TQduvLgQeHCwDgSeMfTxXlq79hKWH
         vlfF83jP9VXR0ao9aRPL6TBrqTLUtSrSX9izA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=fmszmsa19doMDiKVkd5JyjEU2EGslIacVXAuEqSrae8=;
        b=H91i5vFcWr30MEhLFBw9Svls82YmT7nThx2Kw9MmvM8eurW/hurgp1KGyg1FTA+IFd
         IHTp3LkvQWRfQvu3/lAIEfXKf9ydZbX3ZBTu0K5od9Yjij8WlWoyqKsFIYUs/W3g8jGk
         1rIsXq77437MsBGG6o0cTEIvHNocQdJGLMpgoWmN8EsxEONGlssYtBhcLe8iEpzqTtA8
         fb8k15OpcXrrSLzp/bE1ldsWWhpgfM6IPlmJmDvDtDnwDVF/GvrhFDcSHBnLKNO8fuXJ
         Q1/fRXWScWrOhJsym7ZuQWBdjXVlnLv63ZpHanTmVS0nUCNl469YMIGrwcrOQzYMhAbx
         0sYQ==
X-Gm-Message-State: APjAAAWDwdoiQdDm5i7mJXlQerwjI4lIxvmWPIrx2PC3gflJH44Vwex2
        1zE5tXZ+5+ZpNJWyIb83a7IfFg==
X-Google-Smtp-Source: APXvYqw6HSHHsj7mgPXycNxOL2uo40yDdeVwbGg5kQPzgO7awllnUIimHBetpe8MbKVK5Gxm3+WLjQ==
X-Received: by 2002:a63:5508:: with SMTP id j8mr17243237pgb.97.1573843729530;
        Fri, 15 Nov 2019 10:48:49 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k6sm8741468pfi.119.2019.11.15.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 10:48:49 -0800 (PST)
Message-ID: <5dcef311.1c69fb81.f78a4.b0ee@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-3-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-3-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 02/12] drivers: irqchip: qcom-pdc: update max PDC interrupts
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 10:48:48 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:11)
> Newer SoCs have increased the number of interrupts routed to the PDC
> interrupt controller. Update the definition of max PDC interrupts.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

