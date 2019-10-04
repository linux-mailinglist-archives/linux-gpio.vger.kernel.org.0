Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A31DCC4BD
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 23:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730131AbfJDVV2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 17:21:28 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41867 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730101AbfJDVV2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 17:21:28 -0400
Received: by mail-lf1-f66.google.com with SMTP id r2so5413943lfn.8
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OEr/bFV3Od5HcrZnG2EJ9f+c1Io5H/tUIvwwsgn09DA=;
        b=QFNuvKWQbPlZmPs9n2F0eVA+YgD9EtctMySi94fMISEpBd80YJi6m2xw+a5hYnDZ4y
         68FiPlqsMB5vjrVd1JwRpX1DC/OlyexaxS25+syv1cSY4RNBGTkVFEA4oJzycyqZdFMC
         zdOgogn0guvw65iq5yALaQK44zYKvRDt71GOa2s86ejeJIy8mWidB0HsEEy94lPFbnD/
         lmG1v0xS0tbG6XYQK97IBrVdiPxBGtewjO0KK1fL8ldyUnjnkcOT0L1b+y6d1PyFzh4M
         mGSAVl8AwBwYLoUngJ5yzOD4nT7w7z18MoVxsuQxdICDc4GI4Guebj4xAZGe59TDM1zv
         qtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OEr/bFV3Od5HcrZnG2EJ9f+c1Io5H/tUIvwwsgn09DA=;
        b=ilIjLXQinOZaLj2p7GQXRYyeMeqSXZnvCjniiIoPuir4TeAV6SZ41XF7ry38MGIFEh
         4bpRWxpALNEQxs64y4bRAT7B9/lBSbfl0VxOATLhVidEDHMNgi5SYm56+GoUXc8Tu7tT
         sFxh5I6u76nLxtgUD9K/8dA2Noe/Zd6I60hmuPazeWzEbJH7WWAVwX5J2goi9lajj5Kd
         +ENUdg1FrL+3n7Qr49y+REn9+2U8hl2hXUucF4Nffr23PsMAw66qZ4LkRW1lGNHTYAv4
         N1J2gHBiNoO9AMKOWZAr74yTzvsykg/k6zc8m7Z0zT5rlCXx/90hde6eb5tfIFhNwq4b
         OOdw==
X-Gm-Message-State: APjAAAWSUGsHQB5bqwXsm/HKawNEHun4gRHdXEum3GIZvfK8rLXSRbpQ
        TS8QAhCgyxEFzQEWu4PlFFd1dtn2RYO63S9rHOKYvQ==
X-Google-Smtp-Source: APXvYqw+7NMo8aDH8DPzxiviMSnHa6mPSv9NqIb9V8RGcxmjGuTqusV7aNOLUiisggfdETKdZxyD1mGc38XQIKfs0V0=
X-Received: by 2002:a05:6512:25b:: with SMTP id b27mr10395220lfo.60.1570224085049;
 Fri, 04 Oct 2019 14:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190923093637.27968-1-thierry.reding@gmail.com> <20190923095400.GA11084@ulmo>
In-Reply-To: <20190923095400.GA11084@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:21:12 +0200
Message-ID: <CACRpkdYFsSPtnx4a0uA3poK-7L_oh2mSkqPheug4hR7K3JO1jQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: Use of_device_get_match_data()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 23, 2019 at 11:54 AM Thierry Reding
<thierry.reding@gmail.com> wrote:

> Actually, scratch that. We can't do this because the match table is
> different for the legacy case from what the new PHY driver uses which
> calls this only for the legacy case. Instead, I'd propose the attached
> patch.

OK I applied that instead.

Yours,
Linus Walleij
