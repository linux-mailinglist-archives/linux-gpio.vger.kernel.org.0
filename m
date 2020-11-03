Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A83F2A4D90
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 18:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbgKCRyF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 12:54:05 -0500
Received: from sonic315-13.consmr.mail.bf2.yahoo.com ([74.6.134.123]:33986
        "EHLO sonic315-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728993AbgKCRyF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 12:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1604426043; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=bch5D8P6YjV82Ju66FbHMeusleo+2ujG+/1HVfc6dOVpyQ+M6ie9VSQeZAKzTlg6rOO6hQvzXc9WIl1U/JE6KrHgo23RnALPjUcNtPJlpdzsJ4Zj4PLvaAsZ7crYewOq5W/wLzLBWRx35StssAD2Bh9upXKy0eYsDOfyqUz8hG32cGilaKvpGo736zCu9BqZYgRzD4XjmxPrMZXURkXqwQUt8IKH+ORy3lCZ3r+xySRGgP+dwe2R2w3tQKjc8bRQk4NTx5GOngjP0doIYxpmFz3Afw8G6fhcYPo2wok3ET98RbbZE0sQccWIuJzxeNdwl/nqj1bdCjy2TnKCEtOX7g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1604426043; bh=qQEZU3vsCJDzm3WrCS3MGxnmLeq7dob4JhL/UCo9Ufb=; h=Date:From:Subject; b=SCk+BTOfvHKEmjjMmrvXaEikeOCaZb9K0dHyJ3Nucdm/QaCygYw3HvgF19ic1ho0FamZXNbCaa2/ZlN6c3WdGOuYlqqd+Tbh6sZU4/Zr+vwwetpfghetyY9V8YR04V4abiFk8B402kaqxhvDKNI89JyAiem/wSV+3P+QHGv9xXXfGVx4u+Nv3w266HKec1H5k/ISTe+GjgvnXKkpyrQWexMw3UNBiV92VM0/j44u+ybxOACKkZ2NG+nFMNggRonvmowImRoLSvSttRWqDMQFG/5GuwxwbJSvmAGd5GaeWzM1uqOf6jMtFb2rv7T4dry1HhErp98Yxi7pJzFaYY3CrQ==
X-YMail-OSG: uNHyDTsVM1lRSmzVA3XmJm1ToLeJl_RWh_UShUCmAEgslRgX52CyDWspeOubmU9
 EQ3VPamHP8ZxEbtLj1gpPaZynb_xFqJ8DXQo36s40bipnjzNkwo3u.1LBfWAAewY7gU7N6feZ5bO
 rDmAYmQQN7_OVlAvbm.8MOEw2jRwTZVVy31cfoky0IpgE_5RfYRroi7eh8UK7TeMxPX0Nnbv3D9b
 7duWaK3mlIuSWw.TyC60LcJqBCkPivDnghI7I.SZ8epGyqWZdVgoJMY_CpmK4ux17d3_sSb1uTyT
 f0Tvh.9SlFKAFxSCu0gigk96rqBVqvHhyoFNyVDT9Cl.zgzlUvZTnRwPeFDU7mknaVeALf1ut62T
 z2XaOKvPWaNTOI3T51hfEmNONQPKSRMhzMK9qWdp3T_niNB2r9vAu2njoYBG0daDoDvvoRFD_jxM
 f1w5Eh9vqeMP5XCNvXfSWlb9TwShx4LjA5MUzmMG8bZOuK4XkB2cSwJHdN2Rhhd1i5jSj0pVfAh1
 f.k6vck3o8XQUn7RiRWtVRzUwPnJ8XD.cMvw6MOSkiel.b8Femdj.bmsGlWxxLl56qNR2iLRXPMs
 Xt8heJlvib1E8bF4Z973laY3wtvM3k255hXVJ5wcmsJ62GIdU1cCVi_ACBWvfxSJPu8CF9S8c.fv
 Gkp0aevT0JwSYvZiuMOgBjYNzx4zixQjDiXZ2iKyX3Q_yHaiqnYaKoegnvySeYk7mnwsToDulizi
 nBVmVXTuRSVsNnMefTozUF0zhDLTpzJuS0h0DsW3eEGGTFx4TG2O5iSqtybR6pMTk4xdgiDpKb6G
 lT3zE3lgqcY01IlwtpHTlAwuxqZZgYlOjV..j7sbtb7XAYEUH3ue.4QPkOxc2sI0L1leypsMVSAm
 0jI7rGBxrPwnnoa.cfNBz5QQb9E3rhudW3L4IOvAwdyOud_C99e4OvujPUWfTEcoAC9qlJLaaoy8
 Q9bmcjpwMtbwMNoUQ.IRnq0cFZy2jno2Wo0jzTJAbwn8cAnu8N8ja.qTEpXGCNx.x5T3QzBhztdz
 9zaTth4KLwex0U.zbUP5uLGH06Iu_Z8bM6wI_ydzuCO53B0AMH9Cy8OZ.yNMKup5QDmJUb20yCdc
 Qw72dmr4HRSkMJ2.6qa72Q6kkvVtLmBVZnbxRCeiWh7S5hRLrMfbKtpd830W2xT9j2oEbqWI_AV5
 IoD8K0D1GrbL_xZ0jNhxnq51K6FZSrqg1O7JCp9gKHN9qNYm18__7rXYDHHWlwWJV9NkWxQ_6tMN
 EPZEWBu51oj69qwG_LdASWP3DHelVIf5sZ7EkSRijwTpI17uWi4P.N.t1OBG9r4nYjX98YMJBeg3
 h_HmXzuP5QmkbtSao.JHsWyPzWbK.C46sokgMWOqL38XsOC45CF04RdymKUsCZbdATLDogjpZBgg
 3Q2mttr42kIIgFnxXB0VlDcz.MOmz8MyfCu9upDWjTWlWs7Gm9QoNzdbrVgQ5f7hzPgTjP62KFS3
 GRzecezWe3fBowsx98Zu76gp3DBmmOTEeBoU543NdXT1ydFE3kvH_MsXD5qT7r4Q4oEnalc0wVQM
 2IBZdH8J.YipoOs2OMPbNQqH..v.Ur3OGZS7idA_wO6giDImSddwT2DUm0._VUUErYgLJVvujjWh
 MVmPqeorvkWzCZnyoC82TkcEHJMG1fB7y3hHFwtp3FcHWHl83vj0nzlX2HD4dsYJoY8aRvIy7M8X
 6rMcmGTiLQLs2jZw0KVITiuIJfhrpHKwBRToTggf1qn0jst_FZYZsmK59Hg0wkVJqd_Lnj9M0Xpc
 ygFhg4TNCxmZgUuNH39zjNr2QRB8m0iDmIKeHLeq9wNy12RVXXbVjc9lAbHIt2tQ4Qq1OTfGZn2n
 wILWvc4iiH6azLNwiM.2SzTAeMoMH3MGmQj9LkPJDQIWVTmEsxLgEW5u9lMJOdZVt1F7qt0FKpXa
 oEb8hFsHqXu3dIytWpoX8S5fyvEwyakzdfmgNz3r1O_RXK49bzlFT160QBHZQ19L9iRET8lIplJd
 VrtT08mbBA9ceS1pY6sshzncpWWlFeD5Cln6U3SvAqHWn6dbC4nhJwq0zlYs1GtA3yJAc2T9aTgQ
 J7UeQoL_aKsOoGydOm7mIqQ.c.yHhaeMrYsiDvar8ZFXmCwlKuVhVH2Bu1AumH6iTw9YKWA_T8AE
 E0gtZAXFbasolnwg0PoJLZAt1.LMjqekff3ADwZHEepEqJ.ARecDGI66Qh91NXSJ7cgEPowvwa8P
 OGDCB5trDmvYRIdUp4R8a7xXyQjfTAtZLHj3RMlANDAwlqitjDW1yTAHuGrxosWSu.q3JhFPETfd
 5yDhQQZvLWaPyXJgr19I3aRKYnN1sGogI0rJzCW.lWwZjyRwNbfKFW8zepycgmAxggel6U3VRr51
 nsbg9YgqWPTWktIrd2kAOdG5dIvg589wzEV7mhXaVB6pedfdKQlkCjTrEHbs6dr95GRQt76.WZP.
 y_dcL1blxR84TLto1TzH2iJcuMxapncB64ZZoCOWnyXlInvEg97.RD6YPJKiAPX2G0QSUCoB9EBk
 aUqIhudhZzJZxMJe7ub1eLbxQ2LB8EM52bM8NPWTDYYnxoX4eBNE2W6h8zlFGhIsEORhBOCqXEDp
 7tSMa2JdxWcRHOVRrWLBWm3daPeWMmzlcTOKvAX.YdKzN2PcoDvHA4JuTBwZvqFZOe6UH1uf7LIn
 DdjJt5b12rSl2lp4gdudj5UNOP9o0ADLXtGY8YRapZdDC6trpFBgQnmWvrVWeUHBSUdvunImS15Y
 NWobupverv0yo2_HGtPlVYv3Zcfa6HKC.Yi5XeRmyMT_nEIiDXamIqUOlEK_TImmo3RX8jkrXYz.
 .t8CyiZZdQx6hGRLI1PvSZsSh3__OFSf__tKVS1F_rSdM3WbHgyTEMRkMWYHn.BA_p9Dl9VQeIvc
 hrUB2F8Ub6mS8YYsNK4NWFa6P6rU4yfohDjOPqa71z2NpGPzWq3dbpyS6FO7zPvtR7J_DF3A9HNP
 lwZsR5o1hx5ha3kq6CG2Jz04dhyjDxthbMMHwysvgMBQ7mxNhnYkAHlG84NlIeZ53v87ibDKtQau
 OICsyS1px2IWrvHcqZ4RFxUp3NimsYwP8Q_.8kil_3ZIsu1LsuAyeUfMxxfSd13bCesH7.xHq51F
 VozrXHfVY8SFfFIPwNaDZYdYKRyyEZ8mbiqCnTCUbz_BJIFCZQECrFdTxHEpr58DlE9r_hy2e0mD
 XSnvr9EaqvtFbauYTgX99ryeALVglq4cFkzsRrHm7.Th11EYvdv4Cx4AC5oZvGU3xlYk62lGBm3u
 DmpEwxSPpsougA9Dv6h21obOimIT0IGcwMtNoCWhRH0B6ssBAoDFwwB5LVSl.dm56lILXaD1pHGb
 h7gLUbaFbtzhyA7em7SwKVu5bN03MzpHBx.DxX404.qVKL9dXKwi6mxZoBkogxIyJBxkz4PkMZxf
 OKjuptxRNmeNhPDBvEhAMYGOwUJks9d9Q7W4jlqH3ONPZTf_HwX6v5WdOxzU8E8WwGBQiexVXEbh
 mm4NeBj7JW7ZJdYCJa9qnbyV74AEnJhPJMRTDzLGfIiMXwV.xrnc82FWBetcfum2n7K2s8wbSBIv
 eDBa9gBsiC95AoMnqQLu5ZTkETo51CoAqLa65e2O6sp2IOLSXJkhAPU2KMOzCc.vJkZFDDnROcBH
 G.M40EQ5pjbkC1WryBdcVapXFMhnA3BxCXuYSTvVVP17lXpEQE7Xw2P7eLno9Tc6KLFHFcqWhUK4
 oeEwtzozPTWYS4v4lK3en1aaG.NfZKJoHhXvszlukSRPYBy8YhGT56t.TpOVEuudBNgTB64IVWh6
 loSmMIT0UVRM9eV0Gq.yzY1K_UiJjzpctlEupDD2edZ3eYFAbjEgkcPcjlve8GQj6a605PLYktlr
 iEhVpUbXywAWNqnq8ZftiWduWQlt808wQFGVDVJ5wTRO7HB2JVCnhaIAwRsOliiMaEDKdgQWBfH1
 6_vS0B45dfbYX94vHwWMrmZjdfEMNZd2GfbUuTnKOwze_63rO1HLqIo0zDmnDB3O63mRHU9Oshk4
 kfVdm4fmGy6T6f66XIWcsh1X32jROP3braAnffvRyA20d.cKKpSK1CVsBL.XyyXGFg.hSi6dXcwa
 eGVJjH0_M0q2c_dvqqCgXaqJCFrwZuRRKHs9kM1t.8biEOzxrzKnpjKUZxUpX31sM_.hlxB7NKkP
 ue0KfPzQYk6ZesPNZl0ZN1jqnELSrv1NWwuvljtLbo8O_l9EOQbsTE7jjgU3aAre7LSO9H8aeH8u
 WqB_oea7jdVww9_If4zZjYZjr.GfuteMTHdAtpF_m0oSce0grYrjv65f6wlI3V42t.GuoHmHDTiH
 5BfKVQpUkXGRxW6zwedjakYo2OQAe6Ptmn.pY910SMdHMmYTKvANLy7qAlQqAm9R475FXRjbjzWt
 XbgeSeUtB5lnjx_o33HZhr.pZj4yW6rKGTwSvenoXr8GQoUi5UFdO8rKJ71bn2Q2PS.GSaOKvSLM
 LRvEjP44PmLtwwQeVCk0DPLsgbeunR5w_6B_F3Q.VQ9NXKAkvYByTbpddFx7I95CgCnhnvFFhn9E
 1vHRz71Iafjbxtu29mPduST_QNKySiN_XUyvvyXoMOiucATG7zJWwlcrLvjZg.SZsQdyrMEvG.mt
 QEJSJlXJKmPIPwK6Fu3qHJEc7qSZwctKLmIuWkfxAZQdtmLiFc2pvPWjDymYmkE1HlbemvJlvGvo
 3PM.3.nk0fh8iv04eHlvU3HPCNWoGkAoSbEysCegALX_qiSpCraP3HUuctvf2qF_iCZHraB7Tf6l
 4ClxCbbZlM0qEnQa7Bb4QTxZzf1PzDkIZQFt9JQDn4lSEUxLFE9D70wVrBX4vJJbbY_PTYFL6yTi
 Si6cEw9GiYKKQFGYwX.f.y4dSEuM4.cWF8ZEWHeYkUfM9xvKXDXSwOnbMXtS1ym7.633N.qz30ce
 XpSPzV4m09aOYYP88.hUGkojuOOP0vDPZmiAFaimQFGNLq5gn9UxD.kZlYLwJBJyrbktXpIAqRwR
 vkUxA1F3wJ.Mv25HjYA817QftloTTUyiXSQJvt2OKpE3TsWg2hgHNJToIweYmkSBvOp8Rqrdug02
 P0Aqvoj0GW2jMXjQ5joWG9Dm7HiH2jDBvWs0P3qVJIL4i9580av_tF7sAVbvRErLm1E5Ft9JbXJ7
 Fo6Q38dK.4zv4tS1vStgL.g--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.bf2.yahoo.com with HTTP; Tue, 3 Nov 2020 17:54:03 +0000
Date:   Tue, 3 Nov 2020 17:54:02 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh111@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1470430950.1119144.1604426042075@mail.yahoo.com>
Subject: BUSINESS CO-OPERATION (Ms Lisa Hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1470430950.1119144.1604426042075.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16944 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



Dear Friend,

I am Ms Lisa hugh, work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me for success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so will can be reaching each other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa hugh.
